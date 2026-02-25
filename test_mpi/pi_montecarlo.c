/**
 * File              : pi_montecarlo.c
 * Author            : David Barcene <dbarcene@indicasat.org.pa>
 * Date              : 25.02.2026
 * Last Modified Date: 25.02.2026
 * Last Modified By  : David Barcene <david.barcene@utp.ac.pa>
 */

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    
    int world_rank, world_size;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    
    double start_time = MPI_Wtime();
    double duration = 1200.0; // 20 minutes in seconds
    long long total_hits = 0;
    long long iterations_per_loop = 1000000;
    
    // Seed random number generator uniquely for each rank
    srand(time(NULL) + world_rank);
    
    while (MPI_Wtime() - start_time < duration) {
        long long local_hits = 0;
        for (long long i = 0; i < iterations_per_loop; i++) {
            double x = (double)rand() / RAND_MAX;
            double y = (double)rand() / RAND_MAX;
            if (x*x + y*y <= 1.0) local_hits++;
        }
    
        // Periodically aggregate results to stress the network
        long long global_hits;
        MPI_Reduce(&local_hits, &global_hits, 1, MPI_LONG_LONG, MPI_SUM, 0, MPI_COMM_WORLD);

        if (world_rank == 0) {
            total_hits += global_hits;
            printf("Time elapsed: %.2f seconds. Current Pi Estimate: %f\n", 
                   MPI_Wtime() - start_time, 
                   4.0 * (double)total_hits / (iterations_per_loop * world_size * ((MPI_Wtime() - start_time)/0.1))); // Rough display
        }
    }

    MPI_Finalize();
    return 0;
}

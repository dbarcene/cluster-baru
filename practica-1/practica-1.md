% Options for packages loaded elsewhere
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{hyphens}{url}
\documentclass[
]{article}
\usepackage{xcolor}
\usepackage{amsmath,amssymb}
\setcounter{secnumdepth}{-\maxdimen} % remove section numbering
\usepackage{iftex}
\ifPDFTeX
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
  \usepackage{textcomp} % provide euro and other symbols
\else % if luatex or xetex
  \usepackage{unicode-math} % this also loads fontspec
  \defaultfontfeatures{Scale=MatchLowercase}
  \defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}
\fi
\usepackage{lmodern}
\ifPDFTeX\else
  % xetex/luatex font selection
\fi
% Use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
\IfFileExists{microtype.sty}{% use microtype if available
  \usepackage[]{microtype}
  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
\makeatletter
\@ifundefined{KOMAClassName}{% if non-KOMA class
  \IfFileExists{parskip.sty}{%
    \usepackage{parskip}
  }{% else
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{6pt plus 2pt minus 1pt}}
}{% if KOMA class
  \KOMAoptions{parskip=half}}
\makeatother
\usepackage{color}
\usepackage{fancyvrb}
\newcommand{\VerbBar}{|}
\newcommand{\VERB}{\Verb[commandchars=\\\{\}]}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
% Add ',fontsize=\small' for more characters per line
\newenvironment{Shaded}{}{}
\newcommand{\AlertTok}[1]{\textcolor[rgb]{1.00,0.00,0.00}{\textbf{#1}}}
\newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.38,0.63,0.69}{\textbf{\textit{#1}}}}
\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.49,0.56,0.16}{#1}}
\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.25,0.63,0.44}{#1}}
\newcommand{\BuiltInTok}[1]{\textcolor[rgb]{0.00,0.50,0.00}{#1}}
\newcommand{\CharTok}[1]{\textcolor[rgb]{0.25,0.44,0.63}{#1}}
\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.38,0.63,0.69}{\textit{#1}}}
\newcommand{\CommentVarTok}[1]{\textcolor[rgb]{0.38,0.63,0.69}{\textbf{\textit{#1}}}}
\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.53,0.00,0.00}{#1}}
\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.00,0.44,0.13}{\textbf{#1}}}
\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.56,0.13,0.00}{#1}}
\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.25,0.63,0.44}{#1}}
\newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.73,0.13,0.13}{\textit{#1}}}
\newcommand{\ErrorTok}[1]{\textcolor[rgb]{1.00,0.00,0.00}{\textbf{#1}}}
\newcommand{\ExtensionTok}[1]{#1}
\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.25,0.63,0.44}{#1}}
\newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.02,0.16,0.49}{#1}}
\newcommand{\ImportTok}[1]{\textcolor[rgb]{0.00,0.50,0.00}{\textbf{#1}}}
\newcommand{\InformationTok}[1]{\textcolor[rgb]{0.38,0.63,0.69}{\textbf{\textit{#1}}}}
\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.00,0.44,0.13}{\textbf{#1}}}
\newcommand{\NormalTok}[1]{#1}
\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.40,0.40,0.40}{#1}}
\newcommand{\OtherTok}[1]{\textcolor[rgb]{0.00,0.44,0.13}{#1}}
\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.74,0.48,0.00}{#1}}
\newcommand{\RegionMarkerTok}[1]{#1}
\newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.25,0.44,0.63}{#1}}
\newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.73,0.40,0.53}{#1}}
\newcommand{\StringTok}[1]{\textcolor[rgb]{0.25,0.44,0.63}{#1}}
\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.10,0.09,0.49}{#1}}
\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.25,0.44,0.63}{#1}}
\newcommand{\WarningTok}[1]{\textcolor[rgb]{0.38,0.63,0.69}{\textbf{\textit{#1}}}}
\setlength{\emergencystretch}{3em} % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\usepackage{bookmark}
\IfFileExists{xurl.sty}{\usepackage{xurl}}{} % add URL line breaks if available
\urlstyle{same}
\hypersetup{
  pdftitle={Práctica - 1 Slurm{,} BWA y Samtools},
  pdfauthor={David Barcene ~david.barcene@utp.ac.pa},
  hidelinks,
  pdfcreator={LaTeX via pandoc}}

\title{Práctica - 1 \emph{Slurm, BWA y Samtools}}
\author{David Barcene
~\href{mailto:david.barcene@utp.ac.pa}{\nolinkurl{david.barcene@utp.ac.pa}}}
\date{2026-02-25}

\begin{document}
\maketitle

\textbf{Objetivo:} Ejecutar el programa \emph{BWA} con un set de datos
reales reproduciendo los resultados, para poder entender como se
ejecutan los comandos con \emph{Slurm}.

\section{Directorios}\label{directorios}

El directorio rincipal \textbf{\textasciitilde/data} consta de 3
subdirectorios:

\begin{itemize}
\item
  \textbf{reads}: Datos de seccuenciación, 12 muestras en sus
  correspondientes archivos.
\item
  \textbf{ref}: Genomas de referencia indexados.
\item
  \textbf{BAM}: directorio output
\end{itemize}

\section{Procedimiento}\label{procedimiento}

\begin{enumerate}
\item
  Ejecutar el programa \textbf{BWA} para alinear la muestra al genoma de
  referencia.f En cada paso reemplazar la palabra "muestra" con el
  nombre de la muestra (ej. \textbf{BAL\_C1\_3h}, \textbf{BAL\_C2\_3h},
  etc.).

\begin{verbatim}
        bwa mem -t 30 -o BAM/BAL_C1_3h_LpmP.sam \
        ref/LpmP_2025_union.fasta \
        reads/muestra_1.fq \
        reads/muestra_2.fq 
\end{verbatim}
\item
  Ejecutar el programa \textbf{samtools} en tres pasos para generar un
  fichero binario de alineamiento en formato \textbf{BAM}

\begin{verbatim}
        # Paso 1: view
        samtools view -b -@ 30 \
        -o BAM/BAL_C1_3h_LpmP_unsorted.bam\
        BAM/BAL_C1_3h_LpmP.sam

        # Paso 2: sort
        samtools sort -b -@ 30 \
        -o BAM/BAL_C1_3h_LpmP.bam\
        BAM/BAL_C1_3h_LpmP_unsorted.sam

        # Paso 3: index
        samtools index BAM/BAL_C1_3h_LpmP.bam
\end{verbatim}
\item
  Ejecutar el programa \textbf{samtools} nuevamente para guardar las
  estadísticas de alineamiento

\begin{verbatim}
        samtools flagstat -@ 30 BAM/BAL_C1_3h_LpmP,bam >
        muestra_stats.txt
\end{verbatim}
\end{enumerate}

\textbf{Nota}: Las opciones \textbf{bwa -t} y \textbf{samtools -\(@\)}
indican el número de núcleos. Este debe coincidir con el que se le
solicite a Slurm via \textbf{\#SBATCH --cpus-per-task}. El máximo numero
de núcleos por nodo es 40.\\

\begin{verbatim}
data
|____BAM
|____ref
| |____LpmP_2025_union.fasta
| |____LpmP_2025_union.fasta.amb
| |____LpmP_2025_union.fasta.ann
| |____LpmP_2025_union.fasta.bwt
| |____LpmP_2025_union.fasta.pac
| |____LpmP_2025_union.fasta.sa
|____reads
| |____BAL_C1_3h_1.fq
| |____BAL_C1_3h_2.fq
| |____BAL_C2_3h_1.fq
| |____BAL_C2_3h_2.fq
| |____BAL_C3_3h_1.fq
| |____BAL_C3_3h_2.fq
| |____BAL_I1_3h_1.fq
| |____BAL_I1_3h_2.fq
| |____BAL_I2_3h_1.fq
| |____BAL_I2_3h_2.fq
| |____BAL_I3_3h_1.fq
| |____BAL_I3_3h_2.fq
| |____BL6_C1_3h_1.fq
| |____BL6_C1_3h_2.fq
| |____BL6_C2_3h_1.fq
| |____BL6_C2_3h_2.fq
| |____BL6_C3_3h_1.fq
| |____BL6_C3_3h_2.fq
| |____BL6_I1_3h_1.fq
| |____BL6_I1_3h_2.fq
| |____BL6_I2_3h_1.fq
| |____BL6_I2_3h_2.fq
| |____BL6_I3_3h_1.fq
| |____BL6_I3_3h_2.fq
\end{verbatim}

\section{Resultados}\label{resultados}

Inicialmente se redactaron tres scripts para ejecutar 3 pasos de
procesamiento sobre todas las muestras de forma secuencial sobre un solo
nodo. Esta solución implica que se debe esperar a que se ejecuten todos
los pasos sobre una sola muestra para poder continuar con la siguiente.

\subsection{Paralelización}\label{paralelizaciuxf3n}

Se redactaron dos scripts, el primero llamado \textbf{sample\_proc.sh}
que contiene todos los pasos para el tratamiento de una sola muestra en
un solo nodo. En este script se colocan los comentarios
\textbf{\#SBATCH} luego del shebang y los programas \textbf{bwa} y
\textbf{samtools} se corren utilizando el comando \textbf{srun} de
\textbf{SLURM} para que sean gestionados.

\begin{verbatim}
#!/bin/bash
#SBATCH --job-name=bio_pipe
#SBATCH --cpus-per-task=30  

# The sample name is passed as the first argument to the script
if [ -z "$1"  ]; then
        echo "Error [1]: No sample name provided." 
        exit 1
fi
    
# Path variables
READS_DIR="./reads"
OUTPUT_DIR="./BAM"
REF="./ref/LpmP_2025_union.fasta"

# Make output dir if doesn't exist yet
mkdir -p $OUTPUT_DIR

MUESTRA=$1
echo "--- Starting Processing for: ${MUESTRA} ---" 

################################# BWA ########################################
# Step 0: BWA 
echo "Step 0: Mapping with BWA"

srun bwa mem -t $SLURM_CPUS_PER_TASK \
    -o ${OUTPUT_DIR}/${MUESTRA}_LpmP.sam \
    ${REF} \
    ${READS_DIR}/${MUESTRA}_1.fq \
    ${READS_DIR}/${MUESTRA}_2.fq 
    
\end{verbatim}

Nótese que luego de \textbf{-t} no se define un número directo de cpus,
en vez se llama la variable interna \textbf{\$SLURM\_CPUS\_PER\_TASK},
la cual está definida por el comando \textbf{\#SBATCH
--cpus-per-task=30}

El uso de este script tiene la siguiente sintaxis:

\begin{Shaded}
\begin{Highlighting}[]
\ExtensionTok{./sample\_proc.sh}\NormalTok{ sample\_name}
\end{Highlighting}
\end{Shaded}

\begin{verbatim}
############################### SAMTOOLS #####################################
# Step 1: Samtools View
echo "Step 1: Samtools View"

srun samtools view -b -@ $SLURM_CPUS_PER_TASK \
    -o ${OUTPUT_DIR}/${MUESTRA}_LpmP_unsorted.bam \
    ${OUTPUT_DIR}/${MUESTRA}_LpmP.sam



# Step 2: Samtools Sort
echo "Step 2: Sorting BAM"

srun samtools sort -@ $SLURM_CPUS_PER_TASK \
    -o ${OUTPUT_DIR}/${MUESTRA}_LpmP.bam \
    ${OUTPUT_DIR}/${MUESTRA}_LpmP_unsorted.bam



# Step 3: Samtools Index
echo "Step 3: Indexing"
srun samtools index -@ $SLURM_CPUS_PER_TASK \
    ${OUTPUT_DIR}/${MUESTRA}_LpmP.bam



# Step 4: Samtools Stats
echo "Step 4: Generating Stats"
srun --output=${OUTPUT_DIR}/${MUESTRA}_stats.txt samtools flagstat -@ $SLURM_CPUS_PER_TASK \
    ${OUTPUT_DIR}/${MUESTRA}_LpmP.bam 

echo "--- Finished Processing for: $MUESTRA ---"
    
\end{verbatim}

\textbf{Nota}: Para los outputs de cada programa de la suite
\textbf{samtools} se debe revisar si tienen salida en stdout (standard
output). \textbf{samtools flagstat} es un ejemplo claro de un programa
sin salida en stdout, por lo cual se le indica a \textbf{srun} el
archivo de salida mediante la opción \textbf{--outpput}.\\
Y el segundo script \textbf{run\_sbatch.sh} es un orquestrador que actúa
como lanzador principal, automatizando el envío de múltiples tareas al
cluster mediante el comando \textbf{sbatch} de \textbf{SLURM} para
enviar el primer \textbf{run\_sbatch.sh} a la cola del cluster.
\textbf{SLURM} se encargará de distribuir las tareas en los nodos
disponibles. En el caso de que hayan más tareas que nodos disponibles,
las tareas extra quedaran pendientes en cola de espera.

\begin{Shaded}
\begin{Highlighting}[]
\CommentTok{\#!/bin/bash}
\VariableTok{READS\_DIR}\OperatorTok{=}\StringTok{"reads"}

\ControlFlowTok{for}\NormalTok{ READ1 }\KeywordTok{in} \VariableTok{$\{READS\_DIR\}}\NormalTok{/}\PreprocessorTok{*}\NormalTok{\_1.fq}\KeywordTok{;} \ControlFlowTok{do}
    \CommentTok{\# Strip filename to get sample name}
    \VariableTok{FILENAME}\OperatorTok{=}\VariableTok{$(}\FunctionTok{basename} \StringTok{"}\VariableTok{$READ1}\StringTok{"}\VariableTok{)}
    \VariableTok{MUESTRA}\OperatorTok{=}\VariableTok{$\{FILENAME}\OperatorTok{\%}\NormalTok{\_1.fq}\VariableTok{\}}
                    
    \BuiltInTok{echo} \StringTok{"Submitting job for sample: }\VariableTok{$\{MUESTRA\}}\StringTok{"}
        
    \CommentTok{\# Launch the processing script and pass the sample}
    \CommentTok{\# name as an argument}
    \ExtensionTok{sbatch} \AttributeTok{{-}{-}job{-}name}\OperatorTok{=}\StringTok{"}\VariableTok{$MUESTRA}\StringTok{"}\NormalTok{ sample\_proc.sh }\StringTok{"}\VariableTok{$MUESTRA}\StringTok{"}
\ControlFlowTok{done}
\end{Highlighting}
\end{Shaded}

Pra poder revisar que tarea se está ejecutando en el cluster se pueden
utilizar las opciones \textbf{sacct} que muestra información de la base
de datos de \textbf{SLURM}, o mediante \textbf{squeue -u username} para
ver que tareas ejecuta nuestro usuario. Adicionalmente se colocó la
opción \textbf{srun --job-name=\$MUESTRA}, mediante la cual se le coloca
le nombre de muestra a cada tarea ejecutada por el orquestrador.

\end{document}

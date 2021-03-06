\name{parallel_structure}
\alias{parallel_structure}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
FUNCTION TO RUN PARALLEL JOBS IN  STRUCTURE
}
\description{
 \code{parallel_structure} is a R function that calls STRUCTURE automatically for a set of predefined jobs. Jobs are distributed among all available computing units (cores or cpu) in order to make the best use of multi-core computer while running analysis of large data sets in STRUCTURE. Distribution of jobs to multiple cpu relies on \code{mclapply} function from the R \link{parallel-package} and \bold{might not be fully functional under Windows architecture, and should not be used in GUI  or embedded environments, because it leads to several processes sharing the same GUI which will likely cause chaos (and possibly crashes).}  see  \code{mclapply} in  \link{parallel-package} for details.

TWO inputs are give to the MPI_structure function:

1-The function argument in R

2-The job specifications written in a "joblist" file, see example joblist \link{structure_jobs}.


}
\usage{
MPI_structure(joblist = NULL, n_cpu = NULL, structure_path = Mac_path, infile = NULL, outpath = NULL,

 numinds = NULL, numloci = NULL, plot_output = 1, label = 1, popdata = 1, popflag = 0, locdata = 0, 
 
 phenotypes = 0, markernames = 0, mapdist = 0, onerowperind = 0, phaseinfo = 0, recessivealleles = 0, 
 
 phased = 0, extracol = 0, missing = -9, ploidy = 2, noadmix = 0, linkage = 0, usepopinfo = 0, locprior = 0,
 
  inferalpha = 1, alpha = 1, popalphas = 0, unifprioralpha = 1, alphamax = 10, alphapropsd = 0.025, freqscorr = 1, 
  
  onefst = 0, fpriormean = 0.01, fpriorsd = 0.05, inferlambda = 0, lambda = 1, computeprob = 1, 
  
  pfromflagonly = 0, ancestdist = 0, startatpopinfo = 0, metrofreq = 10, updatefreq = 1, printqhat = 0,revert_convert=0,
  
  randomize=1, gensback=2, migrprior=0.05, ancestpint = 0.975)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{joblist}{
  Name of the file where list of jobs is stored, see example data: joblist1
}
  \item{n_cpu}{
   number of cpu cores to be used
}
  \item{structure_path}{
    Location of the executable command line STRUCTURE program.  "/Applications/Structure.app/Contents/Resources/Java/bin/" for MacOS.
}
  \item{infile}{
   Location of the input datafile
}
  \item{outpath}{
    location of folder to write the output files
}
  \item{numinds}{
    Number of individuals in data file
}
  \item{numloci}{
    Number of loci in data file
}
  \item{plot_output}{
 If "1" each STRUCTURE job will generate a pdf format graph in "outpath" (printqhat must be 1). If "0" no graphic output is produced
}
  \item{label}{
    Input file contains labels (names) for each individual. 1 = Yes; 0 = No
}
  \item{popdata}{
    Input file contains a user-defined population-of-origin for each individual. 1 = Yes; 0 = No
}
  \item{popflag}{
    Input file contains an indicator variable which says whether to use popinfo when USEPOPINFO==1. 1 = Yes; 0 = No
}
  \item{phenotypes}{
    Input file contains a column of phenotype information. 1 = Yes; 0 = No
}
  \item{markernames}{
    Input file contains a row of marker names. 1 = Yes; 0 = No.
}
  \item{mapdist}{
    The next row of the data file (or the first row if markernames==0) contains a list of mapdistances between neighboring loci
}
  \item{onerowperind}{
    The data for each individual are arranged in a single row. E.g., for diploid data, this would mean that the two alleles for each locus are in consecutive order in the same row, rather than being arranged in the same column, in two consecutive rows
}
  \item{phaseinfo}{
    The row(s) of genotype data for each individual are followed by a row of information about haplotype phase.
}
  \item{extracol}{
    Input file contains an extra column of data 1 = Yes; 0 = No.
}
  \item{missing}{
    code for missing genotype (Default=-9)
}
  \item{ploidy}{
    Ploidy of the organism. Default is 2 (diploid).
}
  \item{usepopinfo}{
    Use prior population information to assist clustering  1 = Yes; 0 = No.
}
  \item{gensback}{
    Number of generations since admixture
}
  \item{migrpriork}{
    an integer used with usepopinfo=1
}
 \item{revert_convert}{
   If usepopinfo=1, will convert population IDs back into the original data file IDs. 1 = Yes; 0 = No.
}
  \item{printqhat}{
     the point estimate for  is not only printed into the main results file, but also into a separate file with suffix ``q''. 1 = Yes; 0 = No. This file is required in order to run the companion program STRAT and to automatically generate graphic output (see plot_output).
}


 \item{locdata}{
     1 = Yes; 0 = No.
}

 \item{recessivealleles}{
     1 = Yes; 0 = No.
}

 \item{phased}{
     1 = Yes; 0 = No.
}

 \item{noadmix}{
     1 = Yes; 0 = No.
}

 \item{linkage}{
     1 = Yes; 0 = No.
}

 \item{locprior}{
     1 = Yes; 0 = No.
}

 \item{inferalpha}{
     1 = Yes; 0 = No.
}

 \item{alpha}{
     value of alpha (default = 1.0)
}

 \item{popalphas}{
    infer separate alpha for each population 1 = Yes; 0 = No.
}

 \item{unifprioralpha}{
     1 = Yes; 0 = No.
}

 \item{alphamax}{
     (maximum value of alpha (default = 10.0))
}

 \item{alphapropsd}{
     
}

 \item{freqscorr}{
     
}

 \item{onefst}{
     
}

 \item{fpriormean}{
     
}

 \item{fpriorsd}{
     
}

 \item{inferlambda}{
     1 = Yes; 0 = No.
}

 \item{lambda}{
     
}

 \item{computeprob}{
     
}

 \item{pfromflagonly}{
     1 = Yes; 0 = No. makes it possible to update the allele frequencies, P , using only a prespecified subset of the individuals. To use this, include a POPFLAG column, and set POPFLAG=1 for individuals who should be used to update , and POPFLAG=0 for individuals who should not be used to update P
}

 \item{ancestdist}{
     
}

 \item{startatpopinfo}{
     
}

 \item{randomize}{ 1=yes; 0= No. Use a different random number seed for each run (this is taken from the system clock).
     
}

 \item{metrofreq}{
     
}

 \item{updatefreq}{
     
}
 \item{ancestpint}{
  Confidence intervals
 
}
# \item{numboxes}{
#  Width of confidence intervals
# 
#}

  \item{...}{
     see http://pritch.bsd.uchicago.edu/software/readme_2_1/node33.html
for complete list of arguments when running STRUCTURE from command line.
}
}
\details{
The function uses \link{parallel-package} to pilot serial STRUCTURE jobs in parallel:
\link{parallel-package} is distributed with R since version 2.14.0
}
\references{

Besnier F, Glover KA (2013) ParallelStructure: A R Package to Distribute Parallel Runs of the Population Genetics Program STRUCTURE on Multi-Core Computers. PLoS ONE 8(7): e70651. doi:10.1371/journal.pone.0070651


\link{parallel-package} 


 STRUCTURE website:  http://pritch.bsd.uchicago.edu/software.html  

}
\author{
Francois Besnier, Kevin Glover
}
\note{

see example data file and joblist file:

\link{structure_data}

\link{structure_jobs}

}

\examples{

## Run according to your platform (windows/Unix) and version of STRUCTURE

##FOR UNIX:

#	system('mkdir structure_results') # create a directory to store results
#	data(structure_data)			  # call data file 
#	data(structure_jobs)			  # call joblist file

## write input files in current working directory ####
#	write(t(structure_jobs),ncol=length(structure_jobs[1,]),file='joblist1.txt')
#	write(t(structure_data),ncol=length(structure_data[1,]),file='example_data.txt')


### call parallel_structure for the given example
### output files are stored in "structure_results/"


## You  have added the path of STRUCTURE executable into /usr/local/bin:

#	parallel_structure(structure_path=NULL,joblist='joblist1.txt',n_cpu=4,infile='example_data.txt',outpath='structure_results/',numinds=987,numloci=9,printqhat=1)

##OTHERWISE

#	Mac_path="/Applications/Structure.app/Contents/Resources/Java/bin/"

#	parallel_structure(structure_path=Mac_path,joblist='joblist1.txt',n_cpu=4,infile='example_data.txt',outpath='structure_results/',numinds=987,numloci=9,printqhat=1)


##FOR WINDOWS:


#	shell('mkdir structure_results') # creat a directory to store results
#	data(structure_data)			  # call data file 
#	data(structure_jobs)			  # call joblist file

## write input files in current working directory ####
#	write(t(structure_jobs),ncol=length(structure_jobs[1,]),file='joblist1.txt')
#	write(t(structure_data),ncol=length(structure_data[1,]),file='example_data.txt')



### call parallel_structure for the given example
### output files are stored in "structure_results/"

## You  have added the path of STRUCTURE executable into your environment variable:

#	parallel_structure(structure_path=NULL,joblist='joblist1.txt',n_cpu=4,infile='example_data.txt',outpath='structure_results/',numinds=987,numloci=9,printqhat=1)

##OTHERWISE

#	Windows_path="c:/Program Files (x86)/Structure2.3.4/bin/"

# (Check the "Windows_path" variable is correct for your version of STRUCTURE):
#	parallel_structure(structure_path=Windows_path,joblist='joblist1.txt',n_cpu=4,infile='example_data.txt',outpath='structure_results/',numinds=987,numloci=9,printqhat=1)


}



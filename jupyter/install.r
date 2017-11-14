
#install all packages from bioconductor 
install.packages('devtools', repos='https://cran.rstudio.com/')
library(devtools)
devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'))
IRkernel::installspec()
source('http://www.bioconductor.org/biocLite.R')
packages_all = unique(c(all_group(),available.packages()))

pkgs <- c("biocViews", "ProtGenerics", "mzR", "MSnbase", "msdata",
          "BiocParallel", "knitr", "rmarkdown", "httr", "RCul", "XML",
          "zlibbioc",'ballgown','pheatmap','ggplot2','clusterProfiler',
          "reshape2",'oligo','org.Hs.eg.db','org.Mm.eg.db','org.Rn.eg.db',
          'limma','edgeR','DEGseq','SCDE','BPSC','DESeq','baySeq','NBPSeq',
          'GSPM','SAMseq','pysch')
pkgs <- packages_all[packages_all %in% pkgs]
biocLite(pkgs)



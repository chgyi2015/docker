#install packages from bioconductor 
install.packages('devtools', repos='https://cran.rstudio.com/')
library(devtools)
devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'))
IRkernel::installspec()
packages_cran = available.packages()


source('http://www.bioconductor.org/biocLite.R')
packages_bioconductor = all_group()
packages_all = unique(c(packages_cran,packages_bioconductor))

pkgs <- c("biocViews", "ProtGenerics", "mzR", "MSnbase", "msdata",
          "BiocParallel", "knitr", "rmarkdown", "httr", "RCul", "XML",
          "zlibbioc",'ballgown','pheatmap','ggplot2','clusterProfiler',
          "reshape2",'oligo','org.Hs.eg.db','org.Mm.eg.db','org.Rn.eg.db',
          'limma','edgeR','DEGseq','SCDE','BPSC','DESeq','baySeq','NBPSeq',
          'GSPM','SAMseq','pysch','AnnotationDbi')
pkgs <- packages_all[packages_all %in% pkgs]
biocLite(pkgs)
biocLite('org.Hs.eg.db','org.Mm.eg.db','org.Rn.eg.db')


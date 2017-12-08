FROM	ubuntu:16.04
ENV	LANG C.UTF-8
RUN	echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' >>/etc/apt/sources.list
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN	apt update && apt -y install python python-tk python-h5py python-pip ipython \
	&& pip install --upgrade pip 
#install scipy numpy pandas matplotlib  #####
RUN	pip install scipy numpy pandas matplotlib
#install qiime 

RUN	pip install qiime
RUN	apt update && \
	apt -y install apt-transport-https \
		       openssl \
                       wget \
                       curl \
	               openssh-server \
                       libcurl4-openssl-dev \
                       libssh2-1-dev	\
                       libssl-dev \
		       libxml2 \
		       libxml2-dev \
		       bowtie2 \
		       bowtie \	
		       bwa \
		       libzmq3-dev \
		       openjdk-8-jdk \
		       openjdk-8-jre \
		       gcc \
		       make \
                       libghc-zlib-dev \
                       bzip2	
RUN	apt update && apt -y install r-base-core

#install jupyter and basic module
RUN	apt update && apt -y install python3 python3-pip  && pip3 install --upgrade pip
RUN	pip3 install jupyter numpy scipy pandas matplotlib bs4 
COPY	docker-entrypoint.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/docker-entrypoint.sh
CMD	docker-entrypoint.sh

##install R3.4.2  ###
RUN	su - -c \	
		"R -e \"install.packages('devtools', repos='https://cran.rstudio.com/');library(devtools);devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'));IRkernel::installspec();source('http://www.bioconductor.org/biocLite.R');biocLite(c('ballgown','pheatmap','ggplot2','clusterProfiler','limma','reshape2','clusterProfiler','oligo','org.Hs.eg.db','psych','DESeq','baySeq','DEGseq','DESeq2','edgeR','SAMseq','readr','readxl','optparse','AnnotationHub','topGO'))\""

#install HTseq##
RUN	pip install HTseq

#install cufflinks####
RUN	mkdir /app
WORKDIR	/app/
RUN	curl -sL http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar -zxC ./; \
	curl -sL https://software.broadinstitute.org/gatk/download/auth?package=GATK | tar -jxC ./
ENV	PATH /app/cufflinks-2.2.1.Linux_x86_64:$PATH
#install hisat2 ####
WORKDIR	/app
RUN	wget -c ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip && unzip hisat2-2.1.0-Linux_x86_64.zip  && \
        rm -rf hisat2-2.1.0-Linux_x86_64.zip  
ENV	PATH /app/hisat2-2.1.0:$PATH

#install strinttie####
RUN	curl -sL http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.3.3b.Linux_x86_64.tar.gz | tar -zxC ./
ENV	PATH /app/stringtie-1.3.3b.Linux_x86_64:$PATH

#add miranda soft #
RUN	wget http://cbio.mskcc.org/microrna_data/miRanda-aug2010.tar.gz; \
        tar -zxvf miRanda-aug2010.tar.gz; \
        rm -rf miRanda-aug2010.tar.gz ;\
        cd miRanda-3.3a; \
        ./configure; \
        make; 
ENV	PATH	/app/miRanda/src/:$PATH

#tophat3##############	
RUN	curl -sL  https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.5.1.tar.gz | tar -zxC ./;\
        cd /app/trinityrnaseq-Trinity-v2.5.1; \
        make 

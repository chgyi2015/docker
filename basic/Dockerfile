FROM	ubuntu:16.04
ENV	LANG C.UTF-8
RUN	echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' >>/etc/apt/sources.list
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN	apt update && \
	apt -y install python \
		       ipython3 \
		       python3-pip \
                       python-pip \
	               apt-transport-https \
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
		       python-tk  \
		       python-h5py   \
                       libghc-zlib-dev \
                       bzip2 \		       
	&& apt autoremove \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* 

RUN	pip3 install --upgrade pip
RUN	pip3 install jupyter numpy scipy pandas matplotlib bs4 rpy2 
RUN	pip install --upgrade pip  && pip install scipy numpy qiime 
COPY	docker-entrypoint.sh /usr/local/bin/
COPY	install.r /tmp/
RUN	R -f /tmp/install.r
RUN	rm -rf /tmp/*
RUN	chmod +x /usr/local/bin/docker-entrypoint.sh

##install R3.4.2  ###
RUN	su - -c \	
		"R -e \"install.packages('devtools', repos='https://cran.rstudio.com/');library(devtools);devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'));IRkernel::installspec();source('http://www.bioconductor.org/biocLite.R');biocLite(c('ballgown','pheatmap','ggplot2','clusterProfiler','limma','reshape2','clusterProfiler','oligo','org.Hs.eg.db','psych','DESeq','baySeq','DEGseq','DESeq2','edgeR','SAMseq','readr','readxl','optparse','AnnotationHub','topGO'))\""



#install cufflinks####
RUN	mkdir /app
WORKDIR	/app/
RUN	curl -sL http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar -zxC ./
ENV	PATH /app/cufflinks-2.2.1.Linux_x86_64
####install GATK####
  GenomeAnalysisTK.-3.8-0.tar.bz2
RUN	curl -sL https://software.broadinstitute.org/gatk/download/auth?package=GATK | tar -jxC ./  && mv GenomeAnalysisTK-* GATK/

#install hisat2 ####
WORKDIR	/app
RUN	wget -c ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip && unzip hisat2-2.1.0-Linux_x86_64.zip  && \
        rm -rf hisat2-2.1.0-Linux_x86_64.zip && 
ENV	PATH /app/hisat2-2.1.0:$PATH

#add miranda soft #
RUN	wget http://cbio.mskcc.org/microrna_data/miRanda-aug2010.tar.gz; \
        tar -zxvf miRanda-aug2010.tar.gz; \
        rm -rf miRanda-aug2010.tar.gz ;\
        cd miRanda-3.3a; \
        ./configure; \
        make; \
ENV	PATH	/app/miRanda/src/:$PATH

#tophat3##############	
RUN	curl -sL  https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.5.1.tar.gz && tar -zxvf Trinity-v2.5.1.tar.gz | tar -zxC ./
WORKDIR	/app/trinityrnaseq-Trinity-v2.5.1
RUN	make
CMD	docker-entrypoint.sh

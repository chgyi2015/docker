FROM	ubuntu:16.04
RUN	echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' >>/etc/apt/sources.list
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN	apt update && \
	apt -y install python \
		       python3 \
		       python3-pip \
                       python-pip \
	               apt-transport-https\
                       r-base-core \
		       openssl \
                       wget \
                       curl \
	               openssh-server \
                       libcurl4-openssl-dev \
                       libssh2-1-dev	\
                       libssl-dev \
		       libxml2 \
		       libxml2-dev \	
	&& apt autoremove \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* 

RUN	pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN	pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple jupyter numpy scipy pandas matplotlib,bs4
RUN	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip 
COPY	docker-entrypoint.sh /usr/local/bin/
RUN	su - -c \	
		"R -e \"install.packages('devtools', repos='https://cran.rstudio.com/');library(devtools);devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'));IRkernel::installspec();source('http://www.bioconductor.org/biocLite.R');biocLite(c('ballgown','pheatmap','ggplot2','clusterProfiler','limma','reshape2','clusterProfiler','oligo','org.Hs.eg.db','psych','DESeq','baySeq','DEGseq','edgeR','SAMseq'))\""
RUN	chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT	docker-entrypoint.sh
CMD	['']
EXPOSE 8888

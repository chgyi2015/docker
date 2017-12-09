FROM	centos:7
COPY    docker-entrypoint.sh /usr/local/bin/
RUN 	yum update ; yum -y install epel-release ;yum clean cache ;yum update ;\
	    yum -y install perl python34 python-devel python34-devel make libpng-devel \
                   freetype-devel gcc gcc-gfortran gcc-c++ readline-devel \
                   libXt-devel bzip2 bzip2-devel bzip2-libs xz-devel.x86_64 \
                   zlib-devel zlib-libs pcre-devel libcurl-devel python2-pip python34-pip \
                   python34-devel ;\
        pip3 install jupyter numpy scipy pandas matplotlib bs4 ;\
	    make /app ;mkdir /app/bin/ ;cd /app/; \
        curl -sL https://mirrors.ustc.edu.cn/CRAN/src/base/R-3/R-3.4.2.tar.gz | tar -zxC ./ ;\
	    cd R-3.4.2 ; ./configure && make && make install ; \ 
        cp /app/R-3.4.2/R /app/bin/ ;\
        chmod +x /usr/local/bin/docker-entrypoint.sh
CMD     docker-entrypoint.sh

ENV	    PATH /app/bin:$PATH
RUN     yum update ; yum -y install openssl-devel openssl-libs
RUN     su - -c \
        "R -e \"install.packages('devtools', repos='https://cran.rstudio.com/');library(devtools);devtools::install_github(c('IRkernel/IRdisplay','IRkernel/IRkernel'));IRkernel::installspec()\""
WORKDIR  /app/
EXPOSE   8888 22
USER     root
WORKDIR /home
CMD     docker-entrypoint.sh


RUN     yum update && \
	yum -y installl openssl openssh-server libcurl-devel libssh2-devel openssl-devel libxml2 libxml2-dev ;\
	cd /app/;\
	curl -sL http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar -zxC ./; \
        curl -sL https://software.broadinstitute.org/gatk/download/auth?package=GATK | tar -jxC ./; \
	export PATH=/app/cufflinks-2.2.1.Linux_x86_64:$PATH ;\
        wget -c ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip ;\
	unzip hisat2-2.1.0-Linux_x86_64.zip  ;\
        cp -R /app/hisat2-2.1.0/hisat2* /app/bin/  ;\
        #install strinttie####
        curl -sL http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.3.3b.Linux_x86_64.tar.gz | tar -zxC ./ ;\
        cp /app/stringtie-1.3.b.Linux_x86_64/stringtie /app/bin/ ;\
        #add miranda soft #
	wget http://cbio.mskcc.org/microrna_data/miRanda-aug2010.tar.gz; \
        tar -zxvf miRanda-aug2010.tar.gz; \
        rm -rf miRanda-aug2010.tar.gz ;\
        cd miRanda-3.3a; \
        ./configure; \
        make;\
        cp -R app/miRanda-3.3a/miranda /app/bin/ ;\
        #tophat3##############  
        curl -sL  https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.5.1.tar.gz | tar -zxC ./;\
        cd /app/trinityrnaseq-Trinity-v2.5.1; \
        make;\
        cp /app/trinityrnaseq-Trinity-v2.5.1/Trinity /app/bin/  ;\
	yum -y autoremove 

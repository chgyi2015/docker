FROM	ubuntu:16.04
WORKDIR	/
RUN	apt update && apt -y install wget gcc make && apt autoclean
RUN	wget http://cbio.mskcc.org/microrna_data/miRanda-aug2010.tar.gz; \
        tar -zxvf miRanda-aug2010.tar.gz; \
        cd miRanda-3.3a; \
        ./configure; \
        make; \
        cp src/miranda /usr/bin/
WORKDIR	/
CMD	miranda
        

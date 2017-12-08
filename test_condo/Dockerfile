FROM	ubuntu:16.04
ENV	LANG C.UTF-8
RUN	echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' >>/etc/apt/sources.list
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN	mkdir /app && cd /app && apt update && apt -y install curl bzip2 gcc make;\
        curl -sL https://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz | tar -zxC ./;\
	cd Python-2.7.3 && ./configure && make && make install 


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
RUN	pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple jupyter numpy scipy pandas matplotlib
RUN	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip 
COPY	docker-entrypoint.sh /usr/local/bin/
COPY	install.r /tmp/
RUN	R -f /tmp/install.r
RUN	rm -rf /tmp/*

RUN	chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT	docker-entrypoint.sh
CMD	['']
EXPOSE 8888

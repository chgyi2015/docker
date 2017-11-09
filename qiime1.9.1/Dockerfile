FROM	ubuntu:16.04
COPY 	sources.list /etc/apt/
RUN	apt update \
	&& apt install -y python python-pip python-tk python-h5py \
	&& apt autoremove \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/*

RUN	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip

RUN	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy scipy
RUN	pip install qiime

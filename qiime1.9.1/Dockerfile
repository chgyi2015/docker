FROM	ubuntu:16.04
RUN	apt update \
	&& apt install -y python python-pip python-tk python-h5py \
	&& apt autoremove \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/*

RUN	pip install --upgrade pip && pip install numpy scipy matplotlib
RUN	pip install qiime

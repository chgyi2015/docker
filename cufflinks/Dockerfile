FROM	ubuntu:16.04
COPY	sources.list /etc/apt/
RUN	apt update && apt install -y libboost-dev git && apt autoremove
RUN	git clone https://github.com/cole-trapnell-lab/cufflinks.git && cd cufflinks && autoreconf --install && ./configure --prefix=/usr/bin && make && make install && rm -rf cufflinks

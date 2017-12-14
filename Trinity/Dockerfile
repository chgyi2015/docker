FROM	ubuntu:16.04
RUN	apt update && apt -y install make c++ libghc-zlib-dev bzip2
ADD	trinityrnaseq-Trinity-v2.5.1 /home/
WORKDIR	/home/trinityrnaseq-Trinity-v2.5.1
RUN	make


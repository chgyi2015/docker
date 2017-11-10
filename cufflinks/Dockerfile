FROM	ubuntu:16.04
RUN	apt update && apt install -y curl && apt autoremove 

RUN	curl -sL http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar -zxC ./ && \
	mv ./cufflinks-2.2.1.Linux_x86_64/* /usr/bin && rm -rf cufflinks-2.2.1.Linux_x86_66


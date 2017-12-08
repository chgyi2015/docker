FROM	centos:7
RUN	yum update ;\
	yum -y install epel-release ;\
	yum update; \
	yum -y install libpng-devel freetype-devel python-pip python34-pip gcc gcc-gfortran gcc-c++ readline-devel libXt-devel bzip2;\
	pip install --upgrade pip ;\
	pip install numpy ; \
	pip install qiime ;\
	mkdir /app ; cd /app ;\
	curl -sL https://mirrors.ustc.edu.cn/CRAN/src/base/R-3/R-3.4.3.tar.gz | tar -zxC ./ ;\
	cd R-3.4.3 ; ./configure && make && make install ;\
 

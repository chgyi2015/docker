FROM	centos:7
RUN 	yum update -y \
	&& yum install -y mailx sendmail

CMD	echo $title 
ENTRYPOINT	mail -s $title $addr < $body

FROM        ubuntu:16.04
RUN         apt-get update && apt-get install -yyq libzmq3-dev openjdk-8-jdk openjdk-8-jre 
RUN         mkdir /app /data /data/human /data/bam /data/vcf 
ADD         ./ /app
RUN         cp /app/GenomeAnalysisTK.jar  /bin/

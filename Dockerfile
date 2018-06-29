FROM        centos:7
MAINTAINER  Anatoly Butko
WORKDIR     /exporter/
RUN         yum -y update && yum clean all
RUN         yum -y install libaio
RUN         yum -y install unzip
<<<<<<< HEAD
ADD         https://github.com/Corundex/database_exporter/releases/download/0.6.3/database_exporter.tar.gz /exporter/
=======
ADD         https://github.com/Corundex/database_exporter/releases/download/0.6.4/database_exporter.tar.gz /exporter/
>>>>>>> 82083ad131e9d1a568fb5f349d8d398b967a7470
RUN         tar -xzvf /exporter/database_exporter.tar.gz
RUN         cp /exporter/config/mysql_exporter.yml /exporter/database_exporter.yml
RUN         mkdir -p /exporter/mysql_collectors
RUN         cp /exporter/config/mysql_collectors/*.yml /exporter/mysql_collectors
ADD         http://library.case.edu/instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp
RUN         unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /exporter
RUN         ln -s /exporter/instantclient_12_1/libclntsh.so.12.1 /exporter/instantclient_12_1/libclntsh.so
ENV         LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/exporter/instantclient_12_1

EXPOSE      9285
<<<<<<< HEAD
ENTRYPOINT  [ "/exporter/database_exporter" ]
=======
ENTRYPOINT  [ "/exporter/database_exporter" ]
>>>>>>> 82083ad131e9d1a568fb5f349d8d398b967a7470

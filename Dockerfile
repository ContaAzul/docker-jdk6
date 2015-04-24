# Pull base image.
FROM ubuntu:14.04
MAINTAINER Carlos Alexandro Becker <carlos@contaazul.com>

RUN echo "Building image using JDK6"

RUN sudo apt-get install -y software-properties-common && \
  sudo add-apt-repository -y ppa:webupd8team/java && \
  sudo apt-get update

RUN sudo apt-get install -y postgresql postgresql-contrib

ADD pg_hba.conf /etc/postgresql/9.2/main/pg_hba.conf

RUN  echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.*/main/postgresql.conf && \
  sudo service postgresql restart

RUN sudo apt-get -y install git wget

RUN wget -O /tmp/maven.tar.gz http://ftp.unicamp.br/pub/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz && \
  sudo tar xzvf /tmp/maven.tar.gz -C /tmp && \
  rm -rf /tmp/maven.tar.gz && \
  sudo mv /tmp/apache-maven-3.2.5 /usr/share/maven3 && \
  sudo ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn

ENV M2_HOME /usr/share/maven3
ENV PATH $M2_HOME/bin:$PATH

RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  sudo apt-get install -y oracle-java6-installer && \
  sudo update-java-alternatives -s java-6-oracle

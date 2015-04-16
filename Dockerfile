# Pull base image.
FROM ubuntu:14.04
MAINTAINER Carlos Alexandro Becker <carlos@contaazul.com>

RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y ppa:webupd8team/java
RUN sudo apt-get update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN sudo apt-get install -y oracle-java6-installer
RUN sudo update-java-alternatives -s java-6-oracle

RUN sudo apt-get -y install git

RUN wget -O /tmp/maven.tar.gz http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN sudo tar xzvf /tmp/maven.tar.gz -C /tmp
RUN rm -rf /tmp/maven.tar.gz
RUN sudo mv /tmp/apache-maven-3.2.5 /usr/share/maven3
RUN sudo ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn

ENV M2_HOME /usr/share/maven3
ENV PATH $M2_HOME/bin:$PATH

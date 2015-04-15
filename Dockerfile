# Pull base image.
FROM ubuntu:14.04

RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y ppa:webupd8team/java
RUN sudo apt-get update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN sudo apt-get install -y oracle-java6-installer
RUN sudo update-java-alternatives -s java-6-oracle

RUN wget -O /tmp/maven.tar.gz http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN sudo tar xzvf /tmp/maven.tar.gz -C /opt
RUN sudo ln -s /opt/apache-maven-3.2.5/bin/mvn /usr/bin/mvn
RUN rm -rf /tmp/maven.tar.gz

ENV M2_HOME /opt/apache-maven-3.2.5
ENV PATH $M2_HOME/bin:$PATH

RUN sudo apt-get -y install git

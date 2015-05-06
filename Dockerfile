FROM ubuntu:14.04
MAINTAINER Carlos Alexandro Becker <carlos@contaazul.com>

RUN apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update

RUN apt-get install -y postgresql postgresql-contrib
ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses = '*'" | tee -a /etc/postgresql/9.3/main/postgresql.conf

RUN apt-get -y install git wget

RUN wget -O /tmp/maven.tar.gz ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz && \
  tar xzvf /tmp/maven.tar.gz -C /tmp && \
  rm -rf /tmp/maven.tar.gz && \
  mv /tmp/apache-maven-3.2.5 /usr/share/maven3 && \
  ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn

ENV M2_HOME /usr/share/maven3
ENV PATH $M2_HOME/bin:$PATH

RUN for i in 6 7 8; do echo oracle-java${i}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java${i}-installer; done

ENV JAVA_VERSION 8
ENV TZ "America/Sao_Paulo"
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

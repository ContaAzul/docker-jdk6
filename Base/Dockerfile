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

RUN apt-get install -y java-common locales debconf gsfonts gsfonts-x11 \
  libfontenc1 libfreetype6 libxfont1 x11-common xfonts-encodings xfonts-utils

ENV M2_HOME /usr/share/maven3
ENV PATH $M2_HOME/bin:$PATH

ENV TZ "America/Sao_Paulo"
ENV PG true

COPY ./entrypoint.sh /
COPY ./install.sh /
ENTRYPOINT ["/entrypoint.sh"]

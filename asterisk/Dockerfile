FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget gnupg2 build-essential libssl-dev libxml2-dev libsqlite3-dev \
    libjansson-dev libcurl4-openssl-dev uuid-dev libncurses5-dev \
    mariadb-client curl vim-tiny \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20.5.0.tar.gz && \
    tar xzf asterisk-20.5.0.tar.gz && \
    cd asterisk-20.5.0 && \
    ./configure --libdir=/usr/lib --with-pjproject-bundled && \
    make menuselect/menuselect menuselect-tree && \
    menuselect/menuselect --enable res_http_websocket --enable res_ari --enable app_mysql --enable cdr_mysql --enable res_srtp && \
    make && make install && make config && \
    ldconfig

COPY conf/ /etc/asterisk/
RUN mkdir -p /var/log/asterisk /var/run/asterisk /var/spool/asterisk && \
    chown -R asterisk:asterisk /etc/asterisk /var/{lib,log,run,spool}/asterisk

EXPOSE 5060/udp 5061/tcp 10000-10100/udp 8088/tcp

CMD ["asterisk", "-f", "-vvv"]
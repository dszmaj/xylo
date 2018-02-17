FROM ubuntu:16.04

ADD . /xylo

RUN apt-get update && \
    apt-get install -y git autotools-dev autoconf libtool screen autogen libssl-dev libdb++-dev libgmp3-dev \
    make automake build-essential libboost-all-dev miniupnpc libminiupnpc-dev libqrencode-dev && \
    cd /tmp && \
    git clone https://github.com/bitcoin-core/secp256k1.git secp && \
    cd /tmp/secp && \
    ./autogen.sh && \
    ./configure && \
    make && \
    ./tests && \
    make install && \
    cd /xylo/src && \
    make -f makefile.unix



WORKDIR /xylo

CMD ["sh"]
ARG ARCH=
FROM ${ARCH}/alpine:3.12

COPY run-squeezelite.sh /run-squeezelite.sh
RUN passwd -l root ; \
    apk add --update --upgrade bash curl libtool && \
    apk add --update --upgrade alpine-sdk git flex bison libtool-dev autoconf && \
    mkdir -p /usr/src && \
    cd /usr/src && \
    git clone https://github.com/stedolan/jq.git && \
    cd jq && \
    git submodule update --init && \
    autoreconf -fi && \
    ./configure --with-oniguruma=builtin && \
    make -j8 && \
    make check && \
    make install


#    cp squeezelite /usr/bin && \
#    cd / && \
#    rm -rf /usr/src && \
#    apk del alpine-sdk git flex bison libtool-dev autoconf && \




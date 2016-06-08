FROM hopkings/ubuntu:14.04
ENV libqbdir=/hopkings/libqb
ENV corosyncdir=/hopkings/corosync
COPY libqb $libqbdir
COPY corosync $corosyncdir
RUN apt-get install -y autoconf make gcc libtool libssl-dev libnss3-dev pkg-config
WORKDIR $libqbdir
RUN ./autogen.sh && ./configure && make && make install
WORKDIR $corosyncdir
RUN ./autogen.sh && ./configure && make && make install
RUN rm -rf $libqbdir && rm -rf $corosyncdir

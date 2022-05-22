FROM steamcmd/steamcmd:centos-8
WORKDIR /app

RUN dnf -y install wget
RUN dnf -y update && \
    dnf -y groupinstall 'Development Tools' && \
    dnf -y install libX11-devel zlib-devel libxcb-devel \
    libxslt-devel libgcrypt-devel libxml2-devel gnutls-devel \
    libpng-devel libjpeg-turbo-devel libtiff-devel \
    dbus-devel fontconfig-devel freetype-devel 

RUN wget https://dl.winehq.org/wine/source/5.x/wine-5.1.tar.xz
RUN tar -Jxf wine-5.1.tar.xz

WORKDIR /app/wine-5.1
RUN ./configure --enable-win64
RUN make
RUN make install

WORKDIR /app
RUN steamcmd +login anonymous +app_update 1829350 +quit

ENTRYPOINT [ "wine64" ]
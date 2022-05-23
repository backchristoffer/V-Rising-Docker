#################################################
# Dockerfile to build V Rising Dedicated Server #
#################################################
FROM steamcmd/steamcmd:ubuntu-20
LABEL maintainer="backchristoffer@hotmail.com"

WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y wget wine xserver-xorg xvfb && apt-get -y update

RUN dpkg --add-architecture i386
RUN apt-get -y update

RUN steamcmd +login anonymous +force_install_dir /app +app_update 1829350 +quit

ENTRYPOINT rm -rf /tmp/.X0-lock && Xvfb :0 -screen 0 1024x768x16 & DISPLAY=:0.0 wine64 \ 
    /app/VRisingServer.exe -gamePort "27015" -queryPort "27016" \
    -serverName "V Rising Server 1" -saveName "world1" -logFile "./logs/VRisingServer1.log"
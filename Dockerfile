FROM steamcmd/steamcmd:ubuntu-20
WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y wget wine xserver-xorg xvfb && apt-get -y update

RUN steamcmd +login anonymous +force_install_dir /app +app_update 1829350 +quit

ENTRYPOINT Xvfb :0 -screen 0 1024x768x16 & DISPLAY=:0.0 wine64 /app/VRisingServer.exe
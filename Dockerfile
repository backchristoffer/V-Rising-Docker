FROM steamcmd/steamcmd:windows
WORKDIR /data
COPY . .
ENV steamcmd=/steamcmd.exe
RUN ./steamcmd.exe +force_install_dir /data
RUN ./steamcmd.exe +login anonymous +app_update 1829350 +quit
CMD ["VRisingServer.exe"]
#################################################
# Dockerfile to build V Rising Dedicated Server #
#################################################
FROM steamcmd/steamcmd:windows-1809
LABEL maintainer="backchristoffer@hotmail.com"
WORKDIR /app
RUN steamcmd +login anonymous +force_install_dir /app +app_update 1829350 +quit
EXPOSE 27015/udp 27016/udp
ENTRYPOINT ["C:\\app\\VRisingServer.exe", "-gamePort", "27015", "-queryPort", "27016", "-serverName", "V Rising Server 1", "-saveName", "world1", "-logFile", ".\\logs\\VRisingServer1.log"]
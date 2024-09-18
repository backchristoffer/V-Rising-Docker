# V Rising Docker
Docker image running V Rising
Uses steamcmd/steamcmd:ubuntu-20 as a base. Launches V Rising Server using Wine. 

Using this as more of an example of how you could use this. The entrypoint could be done with a script instead.

## Run example
~~~~
# docker run -d -p 27015:27015/udp -p 27016:27016/udp --name v-rising-server v-rising-server
~~~~

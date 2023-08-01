FROM openjdk

ARG RAM=8
ARG HEAP=2

WORKDIR /server
COPY server_files/* /server


RUN java -jar forge-1.16.5-36.2.20-installer.jar --installServer
RUN echo "eula=true" > eula.txt
RUN java -Xmx$HEAPG -Xms$RAMG -Xmn96M -XX:UseSSE=3 -XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -XX:SurvivorRatio=16 -Xnoclassgc -server -jar forge-1.16.5-36.2.20.jar nogui
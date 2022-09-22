FROM ubuntu:22.10

WORKDIR /minecraft

# Installing requirements
RUN apt-get -y update
RUN apt-get install -y openjdk-18-jdk-headless
RUN apt-get install -y wget

# Setting up minecraft server
RUN wget -O minecraft_server.jar https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar
RUN echo "eula=true" > eula.txt
CMD java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui

EXPOSE 25565

FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y x11vnc xvfb fluxbox less default-jre
RUN apt-get install -y xterm pcmanfm 
#RUN 	DEBIAN_FRONTEND=noninteractive apt-get install -qq lxde 
RUN 	apt-get clean
EXPOSE 5900

COPY main.sh /
COPY ./programs ./programs
RUN chmod +x main.sh
ENTRYPOINT ["/startup.sh"]

FROM ubuntu:20.04

# get packages
RUN apt-get update
RUN apt-get install -y x11vnc xvfb fluxbox less default-jre
RUN apt-get install -y xterm pcmanfm 
#RUN 	DEBIAN_FRONTEND=noninteractive apt-get install -qq lxde 
RUN 	apt-get clean

# expose port for VNC
EXPOSE 5900

# copy GUI executables and create symlinks for them
COPY ./programs ./programs
RUN ln -s /programs/tempest/bin/tempest /usr/local/bin
RUN ln -s /programs/tablet/tablet /usr/local/bin
RUN ln -s /programs/aliview/aliview /usr/local/bin
RUN ln -s /programs/artemis/art /usr/local/bin
RUN ln -s /programs/artemis/act /usr/local/bin

COPY startup.sh /
RUN chmod +x startup.sh
ENTRYPOINT ["/startup.sh"]

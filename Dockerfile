FROM kasmweb/core-ubuntu-jammy:1.14.0-rolling
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

RUN apt update && apt upgrade -y
RUN apt install -y dpkg xdg-utils unzip

RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.14/obsidian_1.4.14_amd64.deb
RUN dpkg -i obsidian_1.4.14_amd64.deb

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000

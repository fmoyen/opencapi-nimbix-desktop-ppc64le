FROM fmoyen/ubuntu-nimbix-desktop-ppc64le:xenial

RUN apt-get update && apt-get -y install apt-utils
RUN apt-get -y install xterm

ADD helloWorld /usr/bin/

ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
ADD ./NAE/help.html /etc/NAE/help.html

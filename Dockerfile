FROM fmoyen/ubuntu-nimbix-desktop-ppc64le:xenial

RUN apt-get update && apt-get -y install apt-utils
RUN apt-get -y install xterm iputils-ping pciutils

ADD helloWorld /usr/bin/

ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
ADD ./NAE/help.html /etc/NAE/help.html
ADD ./Images/nimbix-logo.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-logo.png
ADD ./Images/nimbix-favicon.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-favicon.png

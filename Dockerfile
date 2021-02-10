FROM fmoyen/ubuntu-nimbix-desktop-ppc64le:xenial

RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y upgrade
RUN apt -y autoremove

RUN apt -y install apt-utils
RUN apt -y install xterm iputils-ping pciutils

RUN apt -y install update-manager-core
RUN do-release-upgrade -f DistUpgradeViewNonInteractive
#RUN do-release-upgrade -d -f DistUpgradeViewNonInteractive

#ADD loop.bash /tmp/loop.bash
#RUN /tmp/loop.bash
#RUN apt install -y tightvncserver

RUN apt -y install libcxl-dev
RUN apt -y install libocxl-dev

RUN apt -y install iproute2 build-essential

ADD helloWorld /usr/bin/

ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
ADD ./NAE/help.html /etc/NAE/help.html
ADD ./Images/nimbix-logo.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-logo.png
ADD ./Images/nimbix-favicon.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-favicon.png

WORKDIR /opt
RUN git clone https://github.com/open-power/snap
RUN git clone https://github.com/OpenCAPI/oc-accel.git
RUN git clone https://github.com/OpenCAPI/oc-utils.git

WORKDIR /opt/snap
RUN make software
WORKDIR /opt/oc-accel
RUN make software
WORKDIR /opt/oc-utils
RUN make install

WORKDIR /opt
RUN chown -Rh nimbix:nimbix snap
RUN chown -Rh nimbix:nimbix oc-accel
RUN chown -Rh nimbix:nimbix oc-utils

#USER nimbix
#WORKDIR /home/nimbix
#RUN git clone https://github.com/open-power/snap
#RUN git clone https://github.com/OpenCAPI/oc-accel.git

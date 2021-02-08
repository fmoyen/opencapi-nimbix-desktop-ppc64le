FROM fmoyen/ubuntu-nimbix-desktop-ppc64le:xenial

RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y upgrade
RUN apt -y autoremove

RUN apt -y install apt-utils
RUN apt -y install xterm iputils-ping pciutils

RUN apt -y install update-manager-core
RUN do-release-upgrade -f DistUpgradeViewNonInteractive

RUN apt -y install libcxl-dev libocxl-dev

ADD helloWorld /usr/bin/

ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
ADD ./NAE/help.html /etc/NAE/help.html
ADD ./Images/nimbix-logo.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-logo.png
ADD ./Images/nimbix-favicon.png /usr/lib/JARVICE/tools/nimbix_desktop/share/icons/nimbix-favicon.png

USER nimbix
WORKDIR /home/nimbix
RUN git clone https://github.com/open-power/snap
RUN git clone https://github.com/OpenCAPI/oc-accel.git

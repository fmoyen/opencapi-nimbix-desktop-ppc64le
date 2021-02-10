#!/bin/bash
for i in `ls /usr/bin/vnc*`; do mv $i $i.ORIG; done

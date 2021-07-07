#!/bin/bash
cd /usr/local/src
git clone https://github.com/davehorton/pcap_ripper.git
cd pcap_ripper
./bootstrap.sh && mkdir build && cd $_ && ../configure && make && sudo make install 
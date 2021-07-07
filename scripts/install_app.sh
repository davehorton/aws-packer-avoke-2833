#!/bin/bash

cd /home/admin/apps
cp /tmp/avoke-rtpengine-fork.tgz apps
cp /tmp/avoke-recording-uploader.tgz apps
cd apps 
tar xvfz avoke-rtpengine-fork.tgz && rm avoke-rtpengine-fork.tgz
tar xvfz avoke-recording-uploader.tgz && rm avoke-recording-uploader.tgz

cd /home/admin/apps/avoke-rtpengine-fork && sudo npm install --unsafe-perm
cd /home/admin/apps/avoke-recording-uploader && sudo npm install --unsafe-perm

cp /tmp/fork.ecosystem.config.js /home/admin/apps/avoke-rtpengine-fork/ecosystem.config.js
cp /tmp/uploader.ecosystem.config.js /home/admin/apps/avoke-recording-uploader/ecosystem.config.js

sudo -u admin bash -c "pm2 install pm2-logrotate"
sudo -u admin bash -c "pm2 set pm2-logrotate:max_size 1G"
sudo -u admin bash -c "pm2 set pm2-logrotate:retain 5"
sudo -u admin bash -c "pm2 set pm2-logrotate:compress true"

sudo chown -R admin:admin  /home/admin/apps

pm2 start /home/admin/apps/avoke-rtpengine-fork/ecosystem.config.js
sudo pm2 start /home/admin/apps/avoke-recording-uploader/ecosystem.config.js

sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u admin --hp /home/admin
sudo -u admin bash -c "pm2 save"
sudo systemctl enable pm2-admin.service

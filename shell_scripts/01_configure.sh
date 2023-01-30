#!/bin/bash

#Enable ufw firewall
sudo ufw enable

# disable password authentication of ssh
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/ssh_config

# restart ssh service to apply  configuration
sudo systemctl restart ssh

# copy the backup script to the remote server
scp /home/gautam/Desktop/02_backup.sh gautam@18.136.204.213:/home/gautam

# Run the script every 2nd day
ssh gautam@18.136.204.213 'crontab -l | { cat; echo "0 0 */2 * * /home/gautam/02_backup.sh"; } | crontab -'

# Run the backup script on remote machine
ssh gautam@18.136.204.213 'bash -s' < /home/gautam/Desktop/02_backup.sh

#!/bin/bash
############################################
  #setup node machine
############################################
useradd ansible
echo "ansible" | passwd --stdin ansible

# Providnig sudoers privilges
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Enabling password based authentication
sed -i s/PasswordAuthentication\ no// /etc/ssh/sshd_config
sed -i s/\#PasswordAuthentication/PasswordAuthentication/ /etc/ssh/sshd_config
systemctl reload sshd

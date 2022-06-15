####################################################
    #setup controller machine on Amazon Linux
####################################################
#!/bin/bash
useradd ansible
echo "ansible" | passwd --stdin ansible

# Providnig sudoers privilges
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Enabling password based authentication
sed -i s/PasswordAuthentication\ no// /etc/ssh/sshd_config
sed -i s/\#PasswordAuthentication/PasswordAuthentication/ /etc/ssh/sshd_config
systemctl reload sshd

# Generate ssh key 
su - ansible -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y"

# Installing ansible
amazon-linux-extras install ansible2 -y

#####################################
      # Copy ssh key to target machine
#####################################
#ssh-copy-id ansibel@<ipaddress>

####################################
    # Test connectivity
####################################
#ansible -m ping all


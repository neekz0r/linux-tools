#!/usr/bin/env bash

# Just a simple bootstrapper. Ensures we have ansible and what not. For now,
# we assume we are on deb/ubuntu.

if ! command -v ansible-playbook &> /dev/null
then
  echo "ansible not found, installing"
  sudo apt install ansible
fi

if ! sudo -n true &> /dev/null
then
  echo "looks like we need a password.. lets set up the sudoers.d file!"
  sudo -i bash -c "echo \"$(whoami) ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$(whoami)"
fi
# ansible won't read ansible.cfg if it's a world writeable, so lets fix that now
chmod 775 .

ansible-playbook -e ansible_python_interpreter=/usr/bin/python2.7 -i localhost, main.yml
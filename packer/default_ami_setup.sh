#!/bin/bash
# To fix https://github.com/mitchellh/packer/issues/1054

mkdir /tmp/packer-chef-client
chmod 0755 /tmp/packer-chef-client

mkdir -p /etc/chef/ohai/hints
touch /etc/chef/ohai/hints/ec2.json

mkdir -p /var/log/chef
exit 0

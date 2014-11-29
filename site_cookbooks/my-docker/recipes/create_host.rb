#
# Cookbook Name:: my-docker
# Recipe:: default


# launch docker ec2 host 

node['apt']['compile_time_update'] = true

include_recipe_now 'build-essential'

require 'chef/provisioning'

ssh_key_dir= "#{ENV['HOME']}/.ssh"

with_chef_server "https://#{ENV['CHEF_PUBLIC_IP']}", {
:client_name => Chef::Config[:node_name],
:signing_key_filename => Chef::Config[:client_key]
}

with_driver 'fog:AWS',:log_level=>:debug

with_machine_options :bootstrap_options => { :image_id => 'ami-5db4a934',:key_name=>'chef-node-public-key', :flavor_id=>'m1.small', :block_device_mapping => [{'DeviceName' => '/dev/sda1', 'Ebs.VolumeSize' => 30}]},
                     :ssh_username =>'ubuntu',:sudo=>true


contant=<<EOM
chef_server_url "https://#{ENV['CHEF_PUBLIC_IP']}"
node_name "docker-host"
client_key "/etc/chef/client.pem"
ssl_verify_mode :verify_none
EOM

machine 'docker-host' do
   tag 'docker-host'
   files '/etc/chef/client.rb' => { :content =>"#{contant}"}
   recipe 'docker'
end

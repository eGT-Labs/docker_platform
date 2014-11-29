#
# Cookbook Name:: my-docker
# Recipe:: doker

include_recipe_now 'my-docker::install_chef_provision'

require 'chef/provisioning'

require 'chef/provisioning/docker_driver'

with_driver 'docker'

time = Time.new

time_str=time.strftime("%Y_%m_%d_%H_%M_%S")

chef_server_url=Chef::Config.chef_server_url 

contant=<<EOM
chef_server_url "#{chef_server_url}"
node_name "docker-container-#{time_str}"
client_key "/etc/chef/client.pem"
ssl_verify_mode :verify_none
EOM

machine "docker-container-#{time_str}" do
	 files '/etc/chef/client.rb' => { :content =>"#{contant}"}
     machine_options :docker_options => {
        :base_image => {
        :name => 'ubuntu',
        :repository => 'ubuntu',
        :tag => '14.04'
        },
        :command => '/usr/sbin/httpd'
      }
      validator true
      recipe 'apache2'
end

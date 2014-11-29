node.set['apt']['compile_time_update'] = true
include_recipe_now 'apt'
#node.set['build-essential']['compile_time'] = true
include_recipe_now 'build-essential'

chef_gem 'nokogiri' do 
	version '1.6.1'
	ignore_failure true
end

chef_gem 'chef-provisioning'
chef_gem 'chef-provisioning-docker'

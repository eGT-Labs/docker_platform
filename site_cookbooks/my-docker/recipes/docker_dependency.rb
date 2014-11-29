#
# Cookbook Name:: docker
# Recipe:: doker

case node['platform_family']
when 'debian'
  if node['platform'] == 'ubuntu'

     if node['platform_version'].to_f >= 14.04
                bash "install docker" do 
                   user "root"
                   code <<-EOH


                        
                   EOH
                end   

     elsif node['platform_version'].to_f == 12.04
                bash "install docker" do 
                   user "root"
                   code <<-EOH
                      sudo apt-get -y update
                      sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring -y
                      sudo apt-get install --install-recommends linux-generic-lts-raring xserver-xorg-lts-raring libgl1-mesa-glx-lts-raring -y
                   EOH
                end   
     else
        package 'git'
     end
       
  end 

when 'rhel', 'fedora'
 
when 'windows'
 
when 'mac_os_x'
 
else

end
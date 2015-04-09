#
# Cookbook Name:: rstudio_base
# Recipe:: default
#
# Copyright:: Copyright (c) 2014 eGlobalTech, Inc., all rights reserved
#
# Licensed under the BSD-3 license (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License in the root of the project or at
#
#     http://egt-labs.com/mu/LICENSE.html
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#include_recipe 'docker'
docker_image 'rocker/rstudio'

docker_container 'rocker/rstudio' do
  detach true
  port '8787:8787'
  env ['user=geocloud' 'password=geopass']
  volume '/mnt/docker:/docker-storage'
end
=begin
docker_image 'samalba/docker-registry'
docker_container 'docker-registry' do
  image 'samalba/docker-registry'
  detach true
  hostname 'docker-registry.example.com'
  port '5000:5000'
  env 'SETTINGS_FLAVOR=local'
  volume '/mnt/docker:/docker-storage'
end
=end

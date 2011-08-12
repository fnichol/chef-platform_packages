#
# Cookbook Name:: platform_packages
# Recipe:: default
#
# Copyright 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

bag_item = begin
  data_bag_item(*node['platform_packages']['data_bag'])
rescue => ex
  Chef::Log.info(
    "Data bag #{node['platform_packages']['data_bag'].join('/')} was not " +
    "found due to: #{ex.inspect}, so skipping")
  Hash.new
end

node['platform_packages']['pkgs'] = bag_item['pkgs']

include_recipe 'platform_packages'

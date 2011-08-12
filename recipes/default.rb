#
# Cookbook Name:: platform_packages
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
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

node['platform_packages']['pkgs'].each do |pkg_hash|
  package pkg_hash[:name] do
    %w{version source options action}.each do |attr|
      send(attr, pkg_hash[attr])  if pkg_hash[attr]
    end
  end
end

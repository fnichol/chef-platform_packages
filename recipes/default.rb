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

node[:platform_packages].each do |pkg_hash|
  package pkg_hash[:name] do
    version   pkg_hash[:version]        if pkg_hash[:version]
    source    pkg_hash[:source]         if pkg_hash[:source]
    options   pkg_hash[:options]        if pkg_hash[:options]
    action    pkg_hash[:action].to_sym  if pkg_hash[:action]
  end
end

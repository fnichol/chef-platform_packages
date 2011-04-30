# DESCRIPTION

Installing individual packages via attribute metadata. If your needs are complex
or there is additonal config, then that should be in a standalone recipe/cookbook.

Motivating use case is putting packages like *tree* on systems without cranking
out a cookbook for it.

# REQUIREMENTS

## Supported Platforms

The following platforms are supported by this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu
* debian
* arch
* suse

## Cookbooks

None.

# ATTRIBUTES

## `platform_packages`

A list of packages (represented by a hash of properties) to be installed on
the system, all of which need no configuration. Each entry in the list is a
hash containing attributes suitable to be passed to the
[package resource](http://wiki.opscode.com/display/chef/Resources#Resources-Package).
For example:

    node['platform_packages'] = [
      { 'name'    => 'tree',
        'action'  => 'upgrade'
      }
    ]

The default is an empty Array.

# USAGE

Simply include the `platform_packages` recipe and populate the
`platform_packages` attribute list.

# LICENSE and AUTHOR

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Copyright:: 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

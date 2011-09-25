# Description

Installs individual packages via attribute or data bag metadata. If your needs
are complex or there is additonal config, then that should be in a
standalone recipe/cookbook.

The motivating use case is putting packages like *tree* on systems without
cranking out a cookbook for it. Mac OS X users can also use this cookbook with
the [homebrew cookbook][homebrew_cb] to install packages.

# Requirements

## Chef

Tested on 0.10.2 but newer and older version should work just fine. File an
[issue][issues] if this isn't the case.

## Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu
* debian
* mac_os_x
* suse
* arch

Please [report][issues] any additional platforms so they can be added.

## Cookbooks

There are **no* external cookbook dependencies. If you are targetting Mac OS
X, then you should consider using the [homebrew cookbook][homebrew_cb].

# Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

## From the Opscode Community Platform

To install this cookbook from the Opscode platform, use the *knife* command:

    knife cookbook site install platform_packages

## Using Librarian

The [Librarian][librarian] gem aims to be Bundler for your Chef cookbooks.
Include a reference to the cookbook in a **Cheffile** and run
`librarian-chef install`. To install with Librarian:

    gem install librarian
    cd chef-repo
    librarian-chef init
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'platform_packages',
      :git => 'git://github.com/fnichol/chef-platform_packages.git', :ref => 'v0.4.2'
    END_OF_CHEFFILE
    librarian-chef install

## Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-platform_packages/v0.4.2

## As a Git Submodule

A common practice (which is getting dated) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-platform_packages.git cookbooks/platform_packages
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

## As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-platform_packages/tarball/v0.4.2 | tar xfz - && \
      mv fnichol-chef-platform_packages-* platform_packages

# Usage

Simply include `recipe[platform_packages]` in your run_list and populate the
`node['platform_packages']['pkgs']` attribute list.

To use `recipe[platform_packages::data_bag]`, include it in your run_list and
have a data bag called `pkgs` with an item name corresponding to your
platform like the following:

    {
      "id"    : "ubuntu",
      "pkgs"  : [
        { "name"    : "tree",
          "action"  : "upgrade"
        },
        { "name"    : "stow" }
      ]
    }

Alternatively, you can override the data bag and item by setting the
`node['platform_packages']['data_bag']` attribute to some like:

    node['platform_packages']['data_bag'] = ['apps', "workstation-mac"]

# Recipes

## default

Processes a list of *pkgs* (which is emtpy by default) to be installed.

Use this recipe when you have a list of packages in
`node['platform_packages']['pkgs']`.

## data_bag

Fetches an list of *pkgs* from a data bag item and appends it to the
`node['platform_packages']['pkgs']` attribute for processing. This recipe then
includes the default recipe, so there is no need to explicitly include
`recipe[platform_packages]`.

Use this recipe when you want data bag driven data in your workflow.

# Attributes

## `pkgs`

An array of package hashes to be installed on the system, all of which need
no configuration. The keys in each hash correspond to the attributes passed to
the [package resource][package]. For example:

    node['platform_packages']['pkgs'] = [
      { 'name'    => 'tree',
        'action'  => 'upgrade'
      },
      { 'name'    => 'stow' }
    ]

The default is an empty Array: `[]`.

## `data_bag`

The data bag and item containing a list of packages to be installed.. This is
used by the `data_bag` recipe. The default is `['pkgs', node['platform']]`.

# Resources and Providers

There are **none** defined.

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

# License and Author

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

[chef_repo]:    https://github.com/opscode/chef-repo
[homebrew_cb]:  http://community.opscode.com/cookbooks/homebrew
[kgc]:          https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:    https://github.com/applicationsonline/librarian#readme
[package]:      http://wiki.opscode.com/display/chef/Resources#Resources-Package

[repo]:         https://github.com/fnichol/chef-platform_packages
[issues]:       https://github.com/fnichol/chef-platform_packages/issues

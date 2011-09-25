maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs individual packages via attribute or data bag metadata."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.3"

supports "ubuntu"
supports "debian"
supports "mac_os_x"
supports "suse"
supports "arch"

recipe "platform_packages", "Processes a list of *pkgs* (which is emtpy by default) to be installed."
recipe "platform_packages::data_bag", "Fetches an list of *pkgs* from a data bag item and sets the `node['platform_packages']['pkgs']` attribute for processing."

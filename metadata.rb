maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs/Configures simple platform_packages without fuss"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3"
recipe           "platform_packages", "Installs a set of simple packages from the platform's package manager"

%w{ ubuntu debian arch suse }.each do |os|
  supports os
end

attribute "platform_packages",
  :display_name => "A list of pacakges",
  :description  => "A list of pacakges (represented by a hash of properties) to be installed on the system, all of which need no configuration.",
  :type         => "array",
  :default      => []

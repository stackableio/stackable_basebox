# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "stackable-base"

  # Update pakage cache
  config.vm.provision :shell, :inline => 'apt-get update -qqy'

  # Mother fucking puppet!
  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
  end

end

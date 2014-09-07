# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box       = "django-dev-box"
    #config.vm.box_url   = 'http://files.vagrantup.com/precise64.box'
    config.vm.host_name = "django-dev-box"
    config.vm.network :private_network, ip: "192.168.22.22"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path    = "puppet/modules"
        puppet.options        = "--verbose --debug"
    end
end

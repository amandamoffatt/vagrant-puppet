# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

conf = YAML.load_file('VMs.yaml')

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.landrush.enabled = conf["use_landrush"]
  config.landrush.tld = conf["tld"]

  # For each VM defined in VMs.yaml...
  conf["vms"].each do |vm|
    # Configure a VM
    config.vm.define vm["name"] do |server| 
      server.vm.box = vm["box"]
      server.vm.hostname = vm["name"]
      server.ssh.insert_key = false
      server.vm.synced_folder ".", "/vagrant", disabled: true
      server.vm.network "private_network", ip: vm["ip"]
      
      if conf["use_landrush"] == true
        server.landrush.host_ip_address = vm["ip"]
      end 
      
      server.vm.provider :virtualbox do |vb|
        vb.name = vm["name"]
        vb.memory = vm["ram"]
      end

      config.vm.provision "shell", path: vm["bootstrap_script"], args: [vm["dns"], vm["provisioner_repo"], vm["provisioner_package"]]

      server.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path = "modules"
      end
    end
  end
end
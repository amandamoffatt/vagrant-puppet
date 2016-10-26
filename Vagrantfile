# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vms = YAML.load_file('VMs.yaml')

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  landrush = true
  landrush_tld = 'vagrant.test'

  config.landrush.enabled = landrush
  config.landrush.tld = landrush_tld

  # For each VM defined in VMs.yaml...
  vms.each do |vms|
    # Configure a VM
    config.vm.define vms["name"] do |server| 
      server.vm.box = vms["box"]
      server.vm.hostname = vms["name"]
      server.ssh.insert_key = false
      server.vm.synced_folder ".", "/vagrant", disabled: true
      server.vm.network "private_network", ip: vms["ip"]
      
      if landrush == true
        server.landrush.host_ip_address = vms["ip"]
      end 
      
      server.vm.provider :virtualbox do |vb|
        vb.name = vms["name"]
        vb.memory = vms["ram"]
      end

      server.vm.provision "shell" do |s|
        s.args = [vms["dns"],vms["provisioner_repo"],vms["provisioner_package"]]
        s.inline = "sudo echo nameserver $1 >> /etc/resolv.conf; sudo rpm -Uvh $2; sudo yum install $3 -y"
      end

      server.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path = "modules"
      end
    end
  end
end

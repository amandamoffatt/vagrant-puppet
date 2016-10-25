# vagrant-puppet
Spin off multiple VMs with the Puppet provisioner using Vagrant and YAML. 

1. Install VirtualBox & VirtualBox Extensions: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
2. Install Vagrant: [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)
3. Install the landrush Vagrant plugin. This provides DNS among your VMs.

    ```$ vagrant plugin install landrush```

4. Install the vagrant-vbguest vagrant plugin. This provides VirtualBox Guest Additions for your VMs.

    ```$ vagrant plugin install vagrant-vbguest```

5. Clone or download this repository.

    ```$ git clone https://github.com/amandamoffatt/vagrant-puppet.git```

6. Edit the `VMs.yaml` file to include information about the VMs you want to create. The default file will create 3x CentOS 7 VMs (puppetnode{1-3}.vagrant.test) with 512 MB RAM, static IPs on the host-only network interfaces, the Google DNS server (8.8.8.8) added to /etc/resolv.conf and the `puppet` package installed from a PuppetLabs yum repository so that the Puppet provisioner can run. At this stage you must include a value for all of the settings for each VM (name, box, ram, ip, dns, provisioner_repo, provisioner_package). 

7. If you want to use a TLD other than *.vagrant.test, edit the `landrush_tld = 'vagrant.test'` value in the Vagrantfile.

8. Start the show. 

    ```$ vagrant up```

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
  VAGRANTFILE_API_VERSION = "2"
   
  Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "centos-6.5-x86_64"
    #config.ssh.private_key_path = "~/.ssh/id_rsa"
    #config.vm.network "public_network"
    config.vm.network "private_network", ip: "192.168.50.100"
    config.vm.hostname = "db2.local"
    #config.vm.synced_folder ".", "/vagrant", type: "nfs", mount_options: options['nfs']['mount_options']
  
  config.vm.provider "vmware_fusion" do |v|
        #v.vmx["sharedFolder0.enabled"] = "TRUE"
        #v.vmx["sharedFolder0.readAccess"] = "TRUE"
        #v.vmx["sharedFolder0.writeAccess"] = "TRUE"
        #v.vmx["sharedFolder0.hostPath"] = "/Users/mpro/share/ibm-java-x86_64-70/jre"
        #v.vmx["sharedFolder0.guestName"] = "jre"
        #v.vmx["sharedFolder0.expiration"] = "never"

        v.vmx["displayName"] = "db2.local"
        v.vmx["numvcpus"] = "2"
        v.vmx["memsize"] = "2048"


        v.vmx["ethernet1.present"] = "TRUE"
  
        v.vmx["ethernet2.present"] = "TRUE"
        v.vmx["ethernet2.addresstype"] = "generated"
        v.vmx["ethernet2.connectiontype"] = "custom"
        v.vmx["ethernet2.virtualdev"] = "e1000"
        v.vmx["ethernet2.vnet"] = "vmnet2"
   end

	config.vm.provider "virtualbox" do |v,override|
		override.vm.box = "centos65-x86_64"
		override.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
#		override.vm.network "hostonly", ip: "192.168.50.4", virtualbox__intnet: true

		#v.customize ["modifyvm", :id, "--nicpromisc1", "allow-all"] 
		v.customize [ "modifyvm", :id, "--cpus", "2" ]
		v.customize [ "modifyvm", :id, "--memory", "2048" ]
	end
   
	config.vm.provision "shell" do |s|
       		s.path = "db2_install.sh"
   	end
end

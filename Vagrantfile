# -*- mode: ruby -*-
# vi: set ft=ruby :
##Las mv de vagrant el usuario es:
#vagrant
#vagrant
#root
#vagrant
Vagrant.configure("2") do |config|

  config.vm.box = "bento/rockylinux-8.7"
  
	#config.vm.synced_folder "jenkins/jenkins_home/ansible", "/vagrant/jenkins/jenkins_home/ansible", 
  #owner: "vagrant",
  #group: "vagrant",
  #mount_options: ["dmode=775,fmode=600"]
  #config.vm.synced_folder "jenkins/jenkins_home/.ssh/", "/vagrant/jenkins/jenkins_home/.ssh", 
  #owner: "vagrant",
  #group: "vagrant",
  #mount_options: ["dmode=755,fmode=644"]
  
	 config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "2048"
	 


 end

  # docker1
    config.vm.define "docker1" do |app|
	config.vm.boot_timeout = 1200
	config.ssh.insert_key = false
    app.vm.hostname = "docker1"
    app.vm.network "private_network", ip: "192.168.33.10"
	#config.vm.network "forwarded_port", guest: 8080, host: 8080
    app.vm.provision "shell", path: "provision/install_docker_centos8.sh"
	end

  # docker2
    config.vm.define "docker2" do |app|
	config.vm.boot_timeout = 1200
	config.ssh.insert_key = false
    app.vm.hostname = "docker2"
    app.vm.network "private_network", ip: "192.168.33.11"
	app.vm.provision "shell", path: "provision/install_docker_centos8.sh"
end
end


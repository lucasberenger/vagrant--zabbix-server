Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-03"
    vb.memory = 1024
    vb.cpus = 2
  end
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.network "public_network", bridge: "wlp4s0"
  config.vm.provision "shell", path: "zabbix.sh"
end

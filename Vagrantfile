# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configure each virtual machine
Vagrant.configure("2") do |config|
   
  #vm para zipkin
  config.vm.define "zipkin" do |zipkin|
    zipkin.vm.box = "generic/ubuntu1804"
    zipkin.vm.hostname = "zipkin"
    zipkin.vm.network "private_network", ip: "192.168.33.16"
    zipkin.vm.network "forwarded_port", guest: 9411, host: 9411
    zipkin.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "zipkin"]
    end
    zipkin.vm.provision "shell", path: "provision/zipkin.sh", privileged: false
  end
    
   #vm para redis
  config.vm.define "redis" do |redis|
    redis.vm.box = "generic/ubuntu1804"
    redis.vm.hostname = "redis"
    redis.vm.network "private_network", ip: "192.168.33.15"
    redis.vm.network "forwarded_port", guest: 6379, host: 6379
    redis.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "redis"]
    end
    redis.vm.provision "shell", path: "provision/redis.sh", privileged: false
  end 
 
  config.vm.define "users-api" do |users_api|
    users_api.vm.box = "generic/ubuntu1804"
    users_api.vm.hostname = "users-api"
    users_api.vm.network "private_network", ip: "192.168.33.10"
    users_api.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "users-api"]
    end
    
    users_api.vm.provision "shell", path: "provision/users_api.sh", privileged: false
  end

  config.vm.define "auth-api" do |auth_api|
    auth_api.vm.box = "generic/ubuntu1804"
    auth_api.vm.hostname = "auth-api"
    auth_api.vm.network "private_network", ip: "192.168.33.11"
    auth_api.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "auth_api"]
    end
    auth_api.vm.provision "shell", path: "provision/auth_api.sh", privileged: false
  end
  config.vm.define "log-processor" do |log_processor|
    log_processor.vm.box = "generic/ubuntu1804"
    log_processor.vm.hostname = "log-processor"
    log_processor.vm.network "private_network", ip: "192.168.33.13"
    log_processor.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "log_processor"]
    end
    log_processor.vm.provision "shell", path: "provision/log_processor.sh", privileged: false
  end

  config.vm.define "todos-api" do |todos_api|
    todos_api.vm.box = "generic/ubuntu1804"
    todos_api.vm.hostname = "todos-api"
    todos_api.vm.network "private_network", ip: "192.168.33.12"
    todos_api.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "todos_api"]
    end
    todos_api.vm.provision "shell", path: "provision/todos_api.sh", privileged: false
  end

  config.vm.define "frontend" do |frontend|
    frontend.vm.box = "generic/ubuntu1804"
    frontend.vm.hostname = "frontend"
    frontend.vm.network "private_network", ip: "192.168.33.14"
    frontend.vm.network "forwarded_port", guest: 80, host: 8080
    frontend.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "frontend"]
    end
    frontend.vm.provision "shell", path: "provision/frontend.sh", privileged: false
  end

end
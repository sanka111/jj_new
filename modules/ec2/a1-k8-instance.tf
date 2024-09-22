# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "k8_master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_master"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[0]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags

   # Define user_data script to install Kubernetes
  user_data = <<-EOF
    #!/bin/bash
    # Update the package list
    sudo apt-get update -y

    # Install Docker (required for Kubernetes)
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

    # Add Docker repository
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update -y
    sudo apt-get install -y containerd.io

    # Configure containerd to use systemd as cgroup driver
    sudo mkdir -p /etc/containerd
    sudo containerd config default > /etc/containerd/config.toml
    sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
    sudo systemctl restart containerd
    sudo systemctl enable containerd

    # Install Kubernetes components (kubelet, kubeadm, kubectl)
    sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    sudo apt-get update -y
    sudo apt-get install -y kubelet kubeadm kubectl
    sudo apt-mark hold kubelet kubeadm kubectl

    # Enable kubelet service
    sudo systemctl enable kubelet

    # Initialize Kubernetes master node (for master node only)
    # kubeadm init --pod-network-cidr=10.244.0.0/16

    # For worker nodes, you would use `kubeadm join` to join the master
    # Join command will come from the master node
  EOF
}

module "k8_woker" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_woker1"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[1]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags
}
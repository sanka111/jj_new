# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "k8_master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_master"
  ami                    = data.aws_ami.amzlinux2-bs.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[0]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags

   # Define user_data script to install Kubernetes
  user_data = <<-EOF
  #!/bin/bash
  # Update the system
  yum update -y

  # Install containerd
  yum install -y containerd

  # Configure containerd
  mkdir -p /etc/containerd
  containerd config default | tee /etc/containerd/config.toml

  # Enable containerd
  systemctl enable containerd
  systemctl start containerd

  # Disable swap (Kubernetes requires swap to be disabled)
  swapoff -a
  sed -i '/swap/d' /etc/fstab

  # Letting iptables see bridged traffic
    echo "br_netfilter" > /etc/modules-load.d/k8s.conf
    modprobe br_netfilter

    echo "net.bridge.bridge-nf-call-ip6tables = 1" > /etc/sysctl.d/k8s.conf
    echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/k8s.conf
    sysctl --system

    # Install Kubernetes components
    cat > /etc/yum.repos.d/kubernetes.repo <<EOF_REPO
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF_REPO

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

# Enable kubelet
systemctl enable kubelet

# Start containerd and kubelet
systemctl start containerd
systemctl start kubelet

# On the control plane (master node), initialize the Kubernetes control plane
# Uncomment the below block for the master node
# kubeadm init --pod-network-cidr=192.168.0.0/16

# For worker nodes, you will use the join command generated by kubeadm init on the master node
# Example: sudo kubeadm join <master-ip>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash>
EOF
}

module "k8_woker" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"      
  # insert the required variables here
  name                   = "k8_woker1"
  ami                    = data.aws_ami.amzlinux2-bs.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = var.private_subnets_ids[1]
  vpc_security_group_ids = [aws_security_group.k8_sg.id]
  tags = var.common_tags
}
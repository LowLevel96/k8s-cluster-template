locals {
  cluster_name                 = "kubernetes.dusanstojnic.com"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-us-east-1a-masters-kubernetes-dusanstojnic-com.id]
  master_security_group_ids    = [aws_security_group.masters-kubernetes-dusanstojnic-com.id]
  masters_role_arn             = aws_iam_role.masters-kubernetes-dusanstojnic-com.arn
  masters_role_name            = aws_iam_role.masters-kubernetes-dusanstojnic-com.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-us-east-1a-kubernetes-dusanstojnic-com.id, aws_autoscaling_group.nodes-us-east-1b-kubernetes-dusanstojnic-com.id, aws_autoscaling_group.nodes-us-east-1c-kubernetes-dusanstojnic-com.id]
  node_security_group_ids      = [aws_security_group.nodes-kubernetes-dusanstojnic-com.id]
  node_subnet_ids              = [aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id, aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id, aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id]
  nodes_role_arn               = aws_iam_role.nodes-kubernetes-dusanstojnic-com.arn
  nodes_role_name              = aws_iam_role.nodes-kubernetes-dusanstojnic-com.name
  region                       = "us-east-1"
  route_table_public_id        = aws_route_table.kubernetes-dusanstojnic-com.id
  subnet_us-east-1a_id         = aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id
  subnet_us-east-1b_id         = aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id
  subnet_us-east-1c_id         = aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id
  vpc_cidr_block               = aws_vpc.kubernetes-dusanstojnic-com.cidr_block
  vpc_id                       = aws_vpc.kubernetes-dusanstojnic-com.id
}

output "cluster_name" {
  value = "kubernetes.dusanstojnic.com"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-east-1a-masters-kubernetes-dusanstojnic-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-kubernetes-dusanstojnic-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-kubernetes-dusanstojnic-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-kubernetes-dusanstojnic-com.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-us-east-1a-kubernetes-dusanstojnic-com.id, aws_autoscaling_group.nodes-us-east-1b-kubernetes-dusanstojnic-com.id, aws_autoscaling_group.nodes-us-east-1c-kubernetes-dusanstojnic-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-kubernetes-dusanstojnic-com.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id, aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id, aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-kubernetes-dusanstojnic-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-kubernetes-dusanstojnic-com.name
}

output "region" {
  value = "us-east-1"
}

output "route_table_public_id" {
  value = aws_route_table.kubernetes-dusanstojnic-com.id
}

output "subnet_us-east-1a_id" {
  value = aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id
}

output "subnet_us-east-1b_id" {
  value = aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id
}

output "subnet_us-east-1c_id" {
  value = aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id
}

output "vpc_cidr_block" {
  value = aws_vpc.kubernetes-dusanstojnic-com.cidr_block
}

output "vpc_id" {
  value = aws_vpc.kubernetes-dusanstojnic-com.id
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-kubernetes-dusanstojnic-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-east-1a-masters-kubernetes-dusanstojnic-com.id
    version = aws_launch_template.master-us-east-1a-masters-kubernetes-dusanstojnic-com.latest_version
  }
  max_size            = 1
  metrics_granularity = "1Minute"
  min_size            = 1
  name                = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-east-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/kubernetes.dusanstojnic.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1a-kubernetes-dusanstojnic-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1a-kubernetes-dusanstojnic-com.id
    version = aws_launch_template.nodes-us-east-1a-kubernetes-dusanstojnic-com.latest_version
  }
  max_size            = 1
  metrics_granularity = "1Minute"
  min_size            = 1
  name                = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/kubernetes.dusanstojnic.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1b-kubernetes-dusanstojnic-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1b-kubernetes-dusanstojnic-com.id
    version = aws_launch_template.nodes-us-east-1b-kubernetes-dusanstojnic-com.latest_version
  }
  max_size            = 0
  metrics_granularity = "1Minute"
  min_size            = 0
  name                = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1b"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/kubernetes.dusanstojnic.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1c-kubernetes-dusanstojnic-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1c-kubernetes-dusanstojnic-com.id
    version = aws_launch_template.nodes-us-east-1c-kubernetes-dusanstojnic-com.latest_version
  }
  max_size            = 0
  metrics_granularity = "1Minute"
  min_size            = 0
  name                = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1c"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1c"
  }
  tag {
    key                 = "kubernetes.io/cluster/kubernetes.dusanstojnic.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id]
}

resource "aws_ebs_volume" "a-etcd-events-kubernetes-dusanstojnic-com" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "a.etcd-events.kubernetes.dusanstojnic.com"
    "k8s.io/etcd/events"                                = "a/a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-kubernetes-dusanstojnic-com" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "a.etcd-main.kubernetes.dusanstojnic.com"
    "k8s.io/etcd/main"                                  = "a/a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_iam_instance_profile" "masters-kubernetes-dusanstojnic-com" {
  name = "masters.kubernetes.dusanstojnic.com"
  role = aws_iam_role.masters-kubernetes-dusanstojnic-com.name
}

resource "aws_iam_instance_profile" "nodes-kubernetes-dusanstojnic-com" {
  name = "nodes.kubernetes.dusanstojnic.com"
  role = aws_iam_role.nodes-kubernetes-dusanstojnic-com.name
}

resource "aws_iam_role_policy" "masters-kubernetes-dusanstojnic-com" {
  name   = "masters.kubernetes.dusanstojnic.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.kubernetes.dusanstojnic.com_policy")
  role   = aws_iam_role.masters-kubernetes-dusanstojnic-com.name
}

resource "aws_iam_role_policy" "nodes-kubernetes-dusanstojnic-com" {
  name   = "nodes.kubernetes.dusanstojnic.com"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.kubernetes.dusanstojnic.com_policy")
  role   = aws_iam_role.nodes-kubernetes-dusanstojnic-com.name
}

resource "aws_iam_role" "masters-kubernetes-dusanstojnic-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.kubernetes.dusanstojnic.com_policy")
  name               = "masters.kubernetes.dusanstojnic.com"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "masters.kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
}

resource "aws_iam_role" "nodes-kubernetes-dusanstojnic-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.kubernetes.dusanstojnic.com_policy")
  name               = "nodes.kubernetes.dusanstojnic.com"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "nodes.kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
}

resource "aws_internet_gateway" "kubernetes-dusanstojnic-com" {
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_key_pair" "kubernetes-kubernetes-dusanstojnic-com-96381a26fc28ca2580d55acd7537021c" {
  key_name   = "kubernetes.kubernetes.dusanstojnic.com-96:38:1a:26:fc:28:ca:25:80:d5:5a:cd:75:37:02:1c"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.kubernetes.dusanstojnic.com-96381a26fc28ca2580d55acd7537021c_public_key")
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
}

resource "aws_launch_template" "master-us-east-1a-masters-kubernetes-dusanstojnic-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-kubernetes-dusanstojnic-com.id
  }
  image_id      = "ami-0ddbdea833a8d2f0d"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-kubernetes-dusanstojnic-com-96381a26fc28ca2580d55acd7537021c.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-kubernetes-dusanstojnic-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                   = "kubernetes.dusanstojnic.com"
      "Name"                                                                                = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"             = "master-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                    = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane" = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"        = ""
      "k8s.io/role/master"                                                                  = "1"
      "kops.k8s.io/instancegroup"                                                           = "master-us-east-1a"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                   = "kubernetes.dusanstojnic.com"
      "Name"                                                                                = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"             = "master-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                    = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane" = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"        = ""
      "k8s.io/role/master"                                                                  = "1"
      "kops.k8s.io/instancegroup"                                                           = "master-us-east-1a"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                   = "kubernetes.dusanstojnic.com"
    "Name"                                                                                = "master-us-east-1a.masters.kubernetes.dusanstojnic.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"             = "master-us-east-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                    = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane" = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"        = ""
    "k8s.io/role/master"                                                                  = "1"
    "kops.k8s.io/instancegroup"                                                           = "master-us-east-1a"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-east-1a.masters.kubernetes.dusanstojnic.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1a-kubernetes-dusanstojnic-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-kubernetes-dusanstojnic-com.id
  }
  image_id      = "ami-0ddbdea833a8d2f0d"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-kubernetes-dusanstojnic-com-96381a26fc28ca2580d55acd7537021c.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-kubernetes-dusanstojnic-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
    "Name"                                                                       = "nodes-us-east-1a.kubernetes.dusanstojnic.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1a.kubernetes.dusanstojnic.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1b-kubernetes-dusanstojnic-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-kubernetes-dusanstojnic-com.id
  }
  image_id      = "ami-0ddbdea833a8d2f0d"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-kubernetes-dusanstojnic-com-96381a26fc28ca2580d55acd7537021c.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-kubernetes-dusanstojnic-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
    "Name"                                                                       = "nodes-us-east-1b.kubernetes.dusanstojnic.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1b"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1b.kubernetes.dusanstojnic.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1c-kubernetes-dusanstojnic-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-kubernetes-dusanstojnic-com.id
  }
  image_id      = "ami-0ddbdea833a8d2f0d"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-kubernetes-dusanstojnic-com-96381a26fc28ca2580d55acd7537021c.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-kubernetes-dusanstojnic-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
      "Name"                                                                       = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "kubernetes.dusanstojnic.com"
    "Name"                                                                       = "nodes-us-east-1c.kubernetes.dusanstojnic.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1c"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1c.kubernetes.dusanstojnic.com_user_data")
}

resource "aws_route_table_association" "us-east-1a-kubernetes-dusanstojnic-com" {
  route_table_id = aws_route_table.kubernetes-dusanstojnic-com.id
  subnet_id      = aws_subnet.us-east-1a-kubernetes-dusanstojnic-com.id
}

resource "aws_route_table_association" "us-east-1b-kubernetes-dusanstojnic-com" {
  route_table_id = aws_route_table.kubernetes-dusanstojnic-com.id
  subnet_id      = aws_subnet.us-east-1b-kubernetes-dusanstojnic-com.id
}

resource "aws_route_table_association" "us-east-1c-kubernetes-dusanstojnic-com" {
  route_table_id = aws_route_table.kubernetes-dusanstojnic-com.id
  subnet_id      = aws_subnet.us-east-1c-kubernetes-dusanstojnic-com.id
}

resource "aws_route_table" "kubernetes-dusanstojnic-com" {
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
    "kubernetes.io/kops/role"                           = "public"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.kubernetes-dusanstojnic-com.id
  route_table_id         = aws_route_table.kubernetes-dusanstojnic-com.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-kubernetes-dusanstojnic-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-kubernetes-dusanstojnic-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-kubernetes-dusanstojnic-com" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-masters-kubernetes-dusanstojnic-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-kubernetes-dusanstojnic-com-ingress-all-0to0-masters-kubernetes-dusanstojnic-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-kubernetes-dusanstojnic-com-ingress-all-0to0-nodes-kubernetes-dusanstojnic-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-ingress-all-0to0-nodes-kubernetes-dusanstojnic-com" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-ingress-tcp-1to2379-masters-kubernetes-dusanstojnic-com" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-ingress-tcp-2382to4000-masters-kubernetes-dusanstojnic-com" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-ingress-tcp-4003to65535-masters-kubernetes-dusanstojnic-com" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-kubernetes-dusanstojnic-com-ingress-udp-1to65535-masters-kubernetes-dusanstojnic-com" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-kubernetes-dusanstojnic-com.id
  source_security_group_id = aws_security_group.nodes-kubernetes-dusanstojnic-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group" "masters-kubernetes-dusanstojnic-com" {
  description = "Security group for masters"
  name        = "masters.kubernetes.dusanstojnic.com"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "masters.kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_security_group" "nodes-kubernetes-dusanstojnic-com" {
  description = "Security group for nodes"
  name        = "nodes.kubernetes.dusanstojnic.com"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "nodes.kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_subnet" "us-east-1a-kubernetes-dusanstojnic-com" {
  availability_zone = "us-east-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "us-east-1a.kubernetes.dusanstojnic.com"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
    "kubernetes.io/role/elb"                            = "1"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_subnet" "us-east-1b-kubernetes-dusanstojnic-com" {
  availability_zone = "us-east-1b"
  cidr_block        = "172.20.64.0/19"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "us-east-1b.kubernetes.dusanstojnic.com"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
    "kubernetes.io/role/elb"                            = "1"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_subnet" "us-east-1c-kubernetes-dusanstojnic-com" {
  availability_zone = "us-east-1c"
  cidr_block        = "172.20.96.0/19"
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "us-east-1c.kubernetes.dusanstojnic.com"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
    "kubernetes.io/role/elb"                            = "1"
  }
  vpc_id = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_vpc_dhcp_options_association" "kubernetes-dusanstojnic-com" {
  dhcp_options_id = aws_vpc_dhcp_options.kubernetes-dusanstojnic-com.id
  vpc_id          = aws_vpc.kubernetes-dusanstojnic-com.id
}

resource "aws_vpc_dhcp_options" "kubernetes-dusanstojnic-com" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
}

resource "aws_vpc" "kubernetes-dusanstojnic-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                                 = "kubernetes.dusanstojnic.com"
    "Name"                                              = "kubernetes.dusanstojnic.com"
    "kubernetes.io/cluster/kubernetes.dusanstojnic.com" = "owned"
  }
}

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = ">= 2.46.0"
    }
  }
}

resource "aws_launch_template" "app_node" {
  name = "step-project-se"

  instance_type = "t2.micro"

  image_id = "ami-01cc34ab2709337aa"

  instance_initiated_shutdown_behavior = "terminate"

  update_default_version = true

  key_name = "step-project-se-key"

  network_interfaces {
    associate_public_ip_address = true

    security_groups = [
      aws_security_group.web.id,
      aws_security_group.ssh.id
    ]
  }

  placement {
    availability_zone = "us-east-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "step-project-se"
    }
  }

  user_data = filebase64("files/user_data.sh")
}
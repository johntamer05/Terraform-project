resource "aws_instance" "ec2" {
  for_each      = { for inst in var.instances : inst.name => inst }
  ami           = var.ami_id
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id
  key_name      = var.key_name
  security_groups = [each.value.security_group_id]


  associate_public_ip_address = each.value.assign_public_ip

  tags = {
    Name = each.value.name
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sleep 180",
      "sudo yum update -y",
      "sudo amazon-linux-extras enable nginx1",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
      
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = each.value.assign_public_ip ? self.public_ip : self.private_ip
      
    }
  }
    
  provisioner "local-exec" {
    command = "echo \"${each.value.name}: Public IP: ${self.public_ip}, Private IP: ${self.private_ip}\" >> all-ips.txt"
  }
}
module "ec2" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v4.1.4"

  name          = var.server_name
  ami           = data.aws_ami.this.id
  instance_type = local.server_size[var.server_size]
  user_data     = file("${path.module}/script/user_data.sh")

  ebs_block_device = [{
    device_name = "/dev/sdf"
    volume_size = var.server_disk_size
    volume_type = "gp3"
  }]
  vpc_security_group_ids = [module.sg.security_group_id]

  create_spot_instance      = var.use_spot
  spot_type                 = "one-time"
  spot_wait_for_fulfillment = true
}

resource "aws_eip" "this" {
  count = var.use_fixed_ip == true ? 1 : 0

  instance = var.use_spot == true ? module.ec2.spot_instance_id : module.ec2.id
  vpc      = true
}

module "sg" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-security-group.git?ref=v4.13.1"

  name        = "minecraft-sg-${var.server_name}"
  description = "Allows players to connect to minecraft server ${var.server_name}"

  ingress_with_cidr_blocks = [
    {
      from_port   = 25565
      to_port     = 25565
      protocol    = "tcp"
      description = "Minecraft port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

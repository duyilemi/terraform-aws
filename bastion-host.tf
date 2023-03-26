resource "aws_instance" "app_bastion" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.appkey.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.INSTANCE_COUNT
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "app-bastion"
  }
  provisioner "file" {
    content     = templatefile("templates/database-deploy.tmpl", { rds-endpoint = aws_db_instance.app_rds.address, dbuser = var.DB_USER, dbpass = var.DB_PASS })
    destination = "/tmp/app-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/app-dbdeploy.sh",
      "sudo /tmp/app-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIVATE_KEY_PATH)
    host        = self.public_ip
  }

  depends_on = [
    aws_db_instance.app_rds
  ]


}

resource "aws_security_group" "app_bean_elb_sg" {
  name        = "app_bean_elb_sg"
  description = "Secutity group for beanstalk elastic load balancer"
  vpc_id      = module.vpc.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-secgrp"
  description = "Security group for bastion ec2 instance"
  vpc_id      = module.vpc.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

}

resource "aws_security_group" "app_prod_sg" {
  name        = "app_prod_sg"
  description = "Security group for beanstalk instances"
  vpc_id      = module.vpc.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.bastion_sg.id]
  }

}

resource "aws_security_group" "app_backend_sg" {
  name        = "app_backend_sg"
  description = "Security group for RDS, ActiveMQ, Elastic Cache"
  vpc_id      = module.vpc.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [aws_security_group.app_prod_sg.id]
  }
  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.bastion_sg.id]
  }
}

resource "aws_security_group_rule" "sec_grp_allow_itself" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app_backend_sg.id
  source_security_group_id = aws_security_group.app_backend_sg.id
}
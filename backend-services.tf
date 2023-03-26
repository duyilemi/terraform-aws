resource "aws_db_subnet_group" "app_rds_subnet_grp" {
  name       = "app_rds_subnet_grp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Subnet Group for RDS"
  }
}

resource "aws_elasticache_subnet_group" "app-elasticchesubgrp" {
  name       = "app-elasticchesubgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Subnet group for elastic cache"
  }
}

resource "aws_db_instance" "app_rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7.41"
  instance_class         = "db.t3.micro"
  db_name                = var.DB_NAME
  username               = var.DB_USER
  password               = var.DB_PASS
  parameter_group_name   = "default.mysql5.7"
  multi_az               = "false"
  publicly_accessible    = "false"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.app_rds_subnet_grp.name
  vpc_security_group_ids = [aws_security_group.app_backend_sg.id]
}

resource "aws_elasticache_cluster" "app_cache" {
  cluster_id           = "app-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  security_group_ids   = [aws_security_group.app_backend_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.app-elasticchesubgrp.name
}

resource "aws_mq_broker" "app_rabbitmq" {
  broker_name        = "app-rabbitmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t3.micro"
  security_groups    = [aws_security_group.app_backend_sg.id]
  subnet_ids         = [module.vpc.private_subnets[0]]
  user {
    username = var.RABBITMQ_USER
    password = var.RABBITMQ_PASS
  }
}
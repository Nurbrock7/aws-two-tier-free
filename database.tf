# RDS lives in the private subnets only.
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = aws_subnet.private[*].id

  tags = { Name = "${var.project_name}-db-subnets" }
}

resource "aws_db_instance" "main" {
  identifier     = "${var.project_name}-db"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = var.db_instance_class

  # Free Tier: 20 GB gp2, single-AZ.
  allocated_storage = 20
  storage_type      = "gp2"
  multi_az          = false

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]
  publicly_accessible    = false

  # Teardown-friendly so you never get surprise charges.
  skip_final_snapshot = true
  deletion_protection = false

  tags = { Name = "${var.project_name}-db" }
}

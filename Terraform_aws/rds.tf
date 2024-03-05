

resource "aws_db_subnet_group" "db_subnetcreation" {
  name = "database_subnet"
  subnet_ids = [aws_subnet.firstsubnet.id, aws_subnet.secondsubnet.id]
  description = "using this subnet for rds instance"
  tags = {
    Name = "database_subnet"
  }
}


resource "aws_db_instance" "first_db_instance" {
  engine = "mysql"
  engine_version = "8.0.31"
  multi_az = false
  identifier = "powerofservice-applicationdatabase"
  username = "ronaldhero"
  password = "ronaldoexpress"
  instance_class = "db.t2.micro"
  allocated_storage = 200
  db_subnet_group_name = aws_db_subnet_group.db_subnetcreation.name
  vpc_security_group_ids = [aws_security_group.sgforalb.id]
  availability_zone = data.aws_availability_zones.available.names[0]
  db_name = "applicationdb"
  skip_final_snapshot = true
  
  depends_on = [ aws_db_subnet_group.db_subnetcreation, aws_subnet.firstsubnet, aws_security_group.sgforalb ]
}

resource "aws_launch_template" "firsttemplate" {
  name = "firstinstance_foralb"
  image_id = var.AMI
  instance_type = var.typeofinstance
  
}
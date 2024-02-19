resource "aws_lb_target_group" "albtarget" {
  name = "firsttargetgroup"
  port =  80
  protocol = "HTTP"
  vpc_id = aws_vpc.management_zone.id
  target_type = "instance"
  load_balancing_algorithm_type = "round_robin"
  
  

  health_check {
    protocol = "HTTP"
    path = "/services/collector/health"
    port = 80
    healthy_threshold = 3
    unhealthy_threshold = 10
    interval = 10
    timeout = 5
    matcher = 200

  }
}
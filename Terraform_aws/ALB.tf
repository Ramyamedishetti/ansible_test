resource "aws_lb" "testapplb" {
    name = "albforapp"
    internal = true
    load_balancer_type = "application"
    security_groups = [aws_security_group.sgforalb.id]
    subnets = [
        aws_subnet.firstsubnet.id,
        aws_subnet.secondsubnet.id,
        aws_subnet.thirdsubnet.id,
        aws_subnet.fourthsubnet.id
    ]   



    depends_on = [ aws_subnet.firstsubnet,aws_subnet.secondsubnet,aws_subnet.thirdsubnet,aws_subnet.fourthsubnet]
}

    




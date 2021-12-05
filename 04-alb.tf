resource "aws_lb" "load-balacer-back" {
  name               = "load-balacer-back"
  internal           = false
  load_balancer_type = "application"

  security_groups    = [
    aws_security_group.web.id
  ]

  subnets = [
    aws_subnet.back-private-subnet-1.id,
    aws_subnet.back-private-subnet-2.id,
    aws_subnet.front-private-subnet-1.id,
    aws_subnet.front-private-subnet-2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name        = "load-balacer-back"
    Environment = "production"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.public_alb.arn
  port = 80

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "There's nothing here"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "my_app" {
  listener_arn = aws_lb_listener.http.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }

  condition {
    host_header {
      values = ["myapp.example.com"]
    }
  }
}

resource "aws_lb_target_group" "app" {
  vpc_id = "vpc-03d43e2e542b53e2e"
  name     = "tg-app"
  port     = 80
  protocol = "HTTP"
}
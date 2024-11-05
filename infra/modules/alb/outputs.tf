output "alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.tg-fargate.arn
}

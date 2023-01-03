output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "로드벨런ㄷ스의 도메인네임"
}

output "asg_name" {
  value       = aws_autoscaling_group.example.name
  description = "오토스케일링 그룹의 이름"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "로드밸런서에 붙어있는 보안그룹의 아이디"
}

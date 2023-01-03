output "alb_dns_name"{
  value = aws_lb.example.dns_name
  description = "로드벨런ㄷ스의 도메인네임"
}

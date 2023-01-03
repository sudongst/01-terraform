output "alb_dns_name" {
  value       = module.webserver_cluster.alb_dns_name
  description = "로드벨런ㄷ스의 도메인네임"
}

provider "local" {
}
# Infra resource
resource "local_file" "foo" {
  # path.module - String inter pdation terraform 변수
  # ${path.module} : string interpolation 문법
  # 파일이 위치한 디렉토리 경로, main.tf
  filename = "${path.module}/foo.txt"
  content  = "Hello World!"
}

data "local_file" "bar" {
  filename = "${path.module}/bar.txt"
}

#출력지정
output "file_bar" {
  value = data.local_file.bar
}

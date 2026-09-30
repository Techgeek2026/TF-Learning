resource "aws_instance" "myec2" {
  ami = "ami-081b0a6eac00b4f53"
  instance_type = "t3.micro"
}

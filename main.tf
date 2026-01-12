terraform {
  required_version = ">= 1.3"
}

resource "local_file" "example" {
  filename = "terraform_from_jenkins.txt"
  content  = "main.tf created using GitHub UI"
}

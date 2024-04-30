provider "null" {}

resource "null_resource" "check_mysql_version" {
  provisioner "local-exec" {
    command = "mysql --version"
  }
}


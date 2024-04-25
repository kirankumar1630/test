# Null resource to execute remote commands
resource "null_resource" "nginx" {
  provisioner "remote-exec" {
    inline = [
      # Update package list
      "sudo apt update -y",

      # Install nginx
      "sudo apt install nginx -y",

      # Check if nginx installation was successful before starting the service
      "if [ $? -eq 0 ]; then sudo systemctl start nginx; else echo 'Error: Nginx installation failed. Please check logs for details.'; fi"
    ]
  }
}

# Output to display NGINX status
output "nginx_status" {
  value = "NGINX installed and running remotely."
}
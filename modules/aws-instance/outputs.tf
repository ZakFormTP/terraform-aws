output "instance_id" {
  description = "ID de l'instance créée"
  value       = aws_instance.EC2project.id
}

output "public_ip" {
  description = "IP publique de l'instance"
  value       = aws_instance.EC2project.public_ip
}

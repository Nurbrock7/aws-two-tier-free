output "load_balancer_url" {
  description = "Open this in a browser to hit the web tier."
  value       = "http://${aws_lb.web.dns_name}"
}

output "database_endpoint" {
  description = "Private RDS endpoint (reachable only from the web tier)."
  value       = aws_db_instance.main.address
}

output "vpc_id" {
  value = aws_vpc.main.id
}

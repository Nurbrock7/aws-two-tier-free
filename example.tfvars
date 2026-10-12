# Copy this to terraform.tfvars (which is gitignored) and fill in real values.
aws_region   = "us-east-1"
project_name = "two-tier-free"
db_password  = "CHANGE_ME_to_a_strong_password"

# Lock the load balancer down to your own IP (recommended). Find yours at https://checkip.amazonaws.com
# my_ip_cidr = "203.0.113.4/32"

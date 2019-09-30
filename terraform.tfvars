# Automatically loaded with the name terraform.tfvars
# Or with -var-file="terraform.tfvars" flag
project          = "terrafrom-tutorial"
credentials_file = "terraform-tutorial.json"
# value with list type
cidrs = ["10.0.0.0/16", "10.1.0.0/16"]
# value with map type
machine_types = {
  "dev"  = "f1-micro"
  "test" = "n1-highcpu-32"
  "prod" = "n1-highcpu-32"
}

# Populate value for the developer
# Useful for scripts to extract outputs
output "ip" {
  value = google_compute_address.vm_static_ip.address
}

# Module output reference
output "vpc_network_subnets_ips" {
  value = module.network.subnets_ips
}

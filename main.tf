provider "google" {
  credentials = file("terraform-tutorial.json")

  project = "terrafrom-tutorial"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# resource <resource type> <resource name>
# <resource type> + <resource name> = <resource ID>
# e.g. <resource ID> = google_compute_netwrok.vpc_network
# Usage: Reference ID by another resource 
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  # Execute only when the resource is created
  # Use terraform taint <resource type>.<resource name> to mark for recreation
  # Use terraform apply to enforce the resource recreation
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.vm_instance.name}: ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link

    # Ensure the intsance is accessible over the internet
    access_config {
      # Ensure vm_static_ip is created before vm_instance
      # Then, set vm_static_ip to nat_ip of the instance
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}

resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}


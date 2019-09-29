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

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name

    # Ensure the intsance is accessible over the internet
    access_config {
    }
  }
}

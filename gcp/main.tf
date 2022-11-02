#https://redlock.atlassian.net/browse/RLP-66465
#Test Cases: https://docs.google.com/spreadsheets/d/1qLMK9P7x0uCvd_u2e1ChmhpSN4MigQdmjm_MF7APKsA/edit#gid=1971188232
# GCP Firewall with Inbound rule overly permissive to All Traffic
#PC-GCP-VPC-221

provider "google" {
  project = "pcs-policy-auto"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "dep-vpc-j1-1-rlp-66465" {
  name = "dep-vpc-j1-1-rlp-66465"
  auto_create_subnetworks = false
}

#case1 - FP
resource "google_compute_firewall" "nvul-vpc-j2-1-rlp-66465" {
  name    = "nvul-vpc-j2-1-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  deny {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  disabled = false
}

#case2 - FP
resource "google_compute_firewall" "nvul-vpc-j2-2-rlp-66465" {
  name    = "nvul-vpc-j2-2-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "all"
  }
  source_ranges = ["::/0"]
  disabled = true
}

#case3 - FP
resource "google_compute_firewall" "nvul-vpc-j2-3-rlp-66465" {
  name    = "nvul-vpc-j2-3-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "tcp"
    ports = ["140"]
  }
  source_ranges = ["0.0.0.0", "192.168.2.0"]
  disabled = false
}

#case4 - tP
resource "google_compute_firewall" "vul-vpc-j2-4-rlp-66465" {
  name    = "vul-vpc-j2-4-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "all"
  }
  source_ranges = ["::/0"]
  disabled = false
}

#case5 - tP
resource "google_compute_firewall" "vul-vpc-j2-5-rlp-66465" {
  name    = "vul-vpc-j2-5-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0", "192.168.2.0"]
  disabled = false
}

#case6 - tP
resource "google_compute_firewall" "vul-vpc-j2-6-rlp-66465" {
  name    = "vul-vpc-j2-6-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  disabled = false
}

#case7 - tP
resource "google_compute_firewall" "vul-vpc-j2-7-rlp-66465" {
  name    = "vul-vpc-j2-7-rlp-66465"
  network = google_compute_network.dep-vpc-j1-1-rlp-66465.name

  allow {
    protocol = "all"
  }
  source_ranges = ["::0"]
  disabled = false
}

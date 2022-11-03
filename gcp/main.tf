resource "google_compute_network" "example" {
  name = "example"
  auto_create_subnetworks = false
}

#case1 - PASS
resource "google_compute_firewall" "compute_firewall_ok_1" {
  name    = "compute_firewall_ok_1"
  network = google_compute_network.example.name

  deny {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  disabled = false
}

#case2 - PASS
resource "google_compute_firewall" "compute_firewall_ok_2" {
  name    = "compute_firewall_ok_2"
  network = google_compute_network.example.name

  allow {
    protocol = "all"
  }
  source_ranges = ["::/0"]
  disabled = true
}

#case3 - PASS
resource "google_compute_firewall" "compute_firewall_ok_3" {
  name    = "compute_firewall_ok_3"
  network = google_compute_network.example.name

  allow {
    protocol = "tcp"
    ports = ["140"]
  }
  source_ranges = ["0.0.0.0", "192.168.2.0"]
  disabled = false
}

#case4 - FAIL
resource "google_compute_firewall" "compute_firewall_not_ok_1" {
  name    = "compute_firewall_not_ok_1"
  network = google_compute_network.example.name
  
  allow {
    protocol = "all"
  }
  source_ranges = ["::/0"]
  disabled = false
}

#case5 - FAIL
resource "google_compute_firewall" "compute_firewall_not_ok_2" {
  name    = "compute_firewall_not_ok_2"
  network = google_compute_network.example.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0", "192.168.2.0"]
  disabled = false
}

#case6 - FAIL
resource "google_compute_firewall" "detect" {
  name    = "detect"
  network = google_compute_network.example.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  disabled = false
}

#case7 - FAIL
resource "google_compute_firewall" "compute_firewall_not_ok_4" {
  name    = "compute_firewall_not_ok_4"
  network = google_compute_network.example.name

  allow {
    protocol = "all"
  }
  source_ranges = ["::0"]
  disabled = false
}

#case8 - FAIL
resource "google_compute_firewall" "detect" {
  name    = "detect"
  network = google_compute_network.example.name

  allow {
    protocol = "all"
  }
  source_ranges = "0.0.0.0/0"
  disabled = false
}

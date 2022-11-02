provider "google" {
  project = "pcs-policy-auto"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "default" {
  name = "test-network"
}

# firewall -> disabled, EGRESS -> false

resource "google_compute_firewall" "disabled-egress" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
  
  direction = "EGRESS"
  
  disabled = true
}

# firewall -> enabled, EGRESS -> false

resource "google_compute_firewall" "enabled-egress" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
  
  direction = "EGRESS"
  
  disabled = false
}

# firewall -> disabled, INGRESS -> false

resource "google_compute_firewall" "disabled-ingress" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
  
  direction = "INGRESS"
  
  disabled = true
}

# firewall -> enabled, INGRESS -> true

resource "google_compute_firewall" "enabled-ingress" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
  
  direction = "INGRESS"
  
}

# firewall -> enabled, INGRESS, not allowed all -> false

resource "google_compute_firewall" "enabled-ingress-not-allowed" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_range = ["0.0.0.0/0","192.168.4.4"]
  
  direction = "INGRESS"
  
}

# firewall -> enabled, INGRESS, not allowed all -> false

resource "google_compute_firewall" "enabled-ingress-allowed" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_range = ["0.0.0.0/0","::/0","0.0.0.0","::0"]
  
  direction = "INGRESS"
  
}

# firewall -> enabled, INGRESS, not allowed all -> false

resource "google_compute_firewall" "enabled-ingress-allowed-1" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
  }

  source_range = ["0.0.0.0/0"]
  
  direction = "INGRESS"
  
}

# firewall -> enabled, INGRESS, not allowed all -> false

resource "google_compute_firewall" "enabled-ingress-allowed-2" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  
  allow {
    protocol = "all"
  }
  
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_range = "0.0.0.0/0"
  
  direction = "INGRESS"
  
  disabled = true
  
}

# firewall -> enabled, INGRESS, allowed all -> false

resource "google_compute_firewall" "enabled-ingress-allowed3" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "all"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_range = ["0.0.0.0/0","192.168.4.4"]
  
  direction = "INGRESS"
  
}

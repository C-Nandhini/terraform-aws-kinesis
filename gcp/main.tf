resource "google_compute_network" "example" {
  name = "example"
  auto_create_subnetworks = false
}

# False Positive Alert
resource "google_sql_database_instance" "nvul-sql-j1-1-rlp-71262" {
  name             = "nvul-sql-j1-1-rlp-71262"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }
    database_flags {
      name  = "log_connections"
      value = "on"
    }
    database_flags {
      name  = "log_disconnections"
      value = "on"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }
    database_flags {
      name  = "log_temp_files"
      value = 0
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = -1
    }
    database_flags {
      name  = "log_min_messages"
      value = "info"
    }
    database_flags {
      name  = "log_error_verbosity"
      value = "default"
    }
    database_flags {
      name  = "log_hostname"
      value = "off"
    }
    database_flags {
      name  = "log_planner_stats"
      value = "off"
    }
    database_flags {
      name  = "log_executor_stats"
      value = "off"
    }
    database_flags {
      name  = "log_parser_stats"
      value = "off"
    }
    database_flags {
      name  = "log_statement_stats"
      value = "off"
    }
    database_flags {
      name  = "log_duration"
      value = "on"
    }
    user_labels = {
      "created_by"  = "automation"
      "purpose" = "regression"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}


# False Positive Alert
resource "google_sql_database_instance" "nvul-sql-j1-2-rlp-71262" {
  name             = "nvul-sql-j1-2-rlp-71262"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }
    database_flags {
      name  = "log_connections"
      value = "on"
    }
    database_flags {
      name  = "log_disconnections"
      value = "on"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }
    database_flags {
      name  = "log_temp_files"
      value = 0
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = -1
    }
    database_flags {
      name  = "log_min_messages"
      value = "error"
    }
    database_flags {
      name  = "log_error_verbosity"
      value = "terse"
    }
    database_flags {
      name  = "log_hostname"
      value = "off"
    }
    database_flags {
      name  = "log_planner_stats"
      value = "off"
    }
    database_flags {
      name  = "log_executor_stats"
      value = "off"
    }
    database_flags {
      name  = "log_parser_stats"
      value = "off"
    }
    database_flags {
      name  = "log_statement_stats"
      value = "off"
    }
    database_flags {
      name  = "log_duration"
      value = "on"
    }
    user_labels = {
      "created_by"  = "automation"
      "purpose" = "regression"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

# Alert Resource
resource "google_sql_database_instance" "vul-sql-j1-3-rlp-71262" {
  name             = "vul-sql-j1-3-rlp-71262"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_statement_stats"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

# Alert Resource
resource "google_sql_database_instance" "vul-sql-j1-4-rlp-71262" {
  name             = "vul-sql-j1-4-rlp-71262"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_lock_waits"
      value = "off"
    }
    database_flags {
      name  = "log_connections"
      value = "off"
    }
    database_flags {
      name  = "log_disconnections"
      value = "off"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "off"
    }
    database_flags {
      name  = "log_temp_files"
      value = -1
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = 0
    }
    database_flags {
      name  = "log_error_verbosity"
      value = "verbose"
    }
    database_flags {
      name  = "log_hostname"
      value = "on"
    }
    database_flags {
      name  = "log_planner_stats"
      value = "on"
    }
    database_flags {
      name  = "log_executor_stats"
      value = "on"
    }
    database_flags {
      name  = "log_parser_stats"
      value = "on"
    }
    database_flags {
      name  = "log_duration"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}


# False Positive Alert
resource "google_sql_database_instance" "nvul-sql-j1-1-rlp-71271" {
  name             = "nvul-sql-j1-1-rlp-71271"
  database_version = "MYSQL_8_0"
  settings {
    database_flags {
      name  = "skip_show_database"
      value = "on"
    }
    database_flags {
      name  = "local_infile"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

# Alert Resource
resource "google_sql_database_instance" "vul-sql-j1-2-rlp-71271" {
  name             = "vul-sql-j1-2-rlp-71271"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

# Alert Resource
resource "google_sql_database_instance" "vul-sql-j1-3-rlp-71271" {
  name             = "vul-sql-j1-3-rlp-71271"
  database_version = "MYSQL_8_0"
  settings {
    database_flags {
      name  = "skip_show_database"
      value = "off"
    }
    database_flags {
      name  = "local_infile"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

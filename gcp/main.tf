#case1 - PASS
resource "google_sql_database_instance" "postgresql-instance-duration-ok-1" {
  name    = "postgresql-instance-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_duration"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case2 - FAIL
resource "google_sql_database_instance" "postgresql-instance-duration-not-ok-1" {
  name    = "postgresql-instance-not-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_duration"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case3 - FAIL
resource "google_sql_database_instance" "postgresql-instance-duration-not-ok-2" {
  name    = "postgresql-instance-not-ok-2"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case1 - PASS
resource "google_sql_database_instance" "postgresql-instance-executor-ok-1" {
  name    = "postgresql-instance-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_executor_stats"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case3 - FAIL
resource "google_sql_database_instance" "postgresql-instance-executor-ok-1" {
  name    = "postgresql-instance-not-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_executor_stats"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case1 - PASS
resource "google_sql_database_instance" "postgresql-instance-parser-ok-1" {
  name    = "postgresql-instance-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_parser_stats"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case3 - FAIL
resource "google_sql_database_instance" "postgresql-instance-parser-not-ok-1" {
  name    = "postgresql-instance-not-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_parser_stats"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case1 - PASS
resource "google_sql_database_instance" "postgresql-instance-planner-ok-1" {
  name    = "postgresql-instance-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_planner_stats"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case3 - FAIL
resource "google_sql_database_instance" "postgresql-instance-planner-not-ok-1" {
  name    = "postgresql-instance-not-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_planner_stats"
      value = "on"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case1 - PASS
resource "google_sql_database_instance" "postgresql-instance-statement-ok-1" {
  name    = "postgresql-instance-ok-1"
  database_version = "POSTGRES_14"
  settings {
    database_flags {
      name  = "log_statement_stats"
      value = "off"
    }
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#case3 - FAIL
resource "google_sql_database_instance" "postgresql-instance-statement-not-ok-1" {
  name    = "postgresql-instance-not-ok-1"
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

#case2 - PASS
resource "google_sql_database_instance" "postgresql-instance-ok-2" {
  name    = "postgresql-instance-ok-2"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection = false
}

#mysql
resource "google_sql_database_instance" "mysql" {
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

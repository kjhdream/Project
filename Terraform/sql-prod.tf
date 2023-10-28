resource "google_sql_database_instance" "sql_prod" {
  name                = "sql-prod"
  database_version    = "MYSQL_8_0"
  root_password       = "qwe123!@#"
  deletion_protection = false

  settings {
    tier              = "db-n1-standard-2"
    availability_type = "REGIONAL"
    disk_size         = 10

    disk_autoresize = true
    disk_autoresize_limit = 20

    location_preference {
      zone           = "asia-northeast3-a"
      secondary_zone = "asia-northeast3-b"
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }

    backup_configuration {
      binary_log_enabled = true
      enabled            = true
      start_time         = "04:00"
      location           = "asia-northeast3"
    }
  }
  depends_on = [google_service_networking_connection.db_connection_test]
}

resource "google_sql_database" "sql_prod_database" {
  instance = google_sql_database_instance.sql_prod.name
  name     = "petclinic"
}

resource "google_sql_user" "sql_prod_user" {
  instance = google_sql_database_instance.sql_prod.name
  name     = "hyyh"
  password = "qwe123!@#"
}

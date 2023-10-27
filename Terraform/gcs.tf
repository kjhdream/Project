resource "google_storage_bucket" "bucket_backend" {
  name          = "bucket-backend-1203"
  location      = "asia-northeast3" 
  force_destroy = false
  storage_class = "STANDARD" 
  public_access_prevention = "enforced"
}

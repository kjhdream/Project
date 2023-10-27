resource "google_artifact_registry_repository" "builded-image" {
  repository_id = "builded-image" 
  format        = "DOCKER" 
  location      = "asia-northeast3"
}

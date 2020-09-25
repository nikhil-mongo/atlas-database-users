resource "mongodbatlas_cluster" "cluster_stockholm" {
  project_id             = mongodbatlas_project.project1.id
  name                   = "stockholm"
  num_shards             = 1
  mongo_db_major_version = "4.2"
  replication_factor     = 3

  //Provider Settings "block"
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = true
  provider_name                = "AWS"
  disk_size_gb                 = 10
  provider_disk_iops           = 100
  provider_volume_type         = "STANDARD"
  provider_instance_size_name  = "M10"
  provider_encrypt_ebs_volume  = true
  provider_region_name         = "EU_NORTH_1"
}
output "atlasclusterstring" {
  value = mongodbatlas_cluster.cluster_stockholm.connection_strings
}
locals {
  minio_vault_path     = "${var.nomad_node_class}/minio/streaming/${var.vsphere_datacenter}"
  s3_provisioned_disks = []
}

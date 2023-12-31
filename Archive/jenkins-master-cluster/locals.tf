locals {
  minio_vault_path     = "${var.nomad_node_class}/minio/jenkins"
  growr_provisioned_disks = [
    {
      DEVICE_DRIVE              = "sdb"
      LABEL                     = "jenkins-master-cache"
    }
  ]
  s3_provisioned_disks = []
  // s3_provisioned_disks = [
  //   {
  //     S3_HOST_1 = data.vault_generic_secret.minio_s3.data["url"]
  //     S3_MOUNT_1 = "/mnt/local/jenkins-master"
  //     S3_UID_1 = "1000"
  //     S3_GID_1 = "1000"
  //     S3_ACL_1 = "private"
  //     S3_CACHE_1 = ""
  //     S3_BUCKET_1 = data.vault_generic_secret.minio_s3.data["bucket"]
  //     S3_ACCESS_KEY_1           = data.vault_generic_secret.minio_s3.data["access_key"]
  //     S3_SECRET_KEY_1           = data.vault_generic_secret.minio_s3.data["secret_key"]
  //     S3_NO_CHECK_CERTIFICATE_1 = "true"
  //     S3_SSL_VERIFY_HOSTNAME_1 = "0"
  //     S3_EXTRA_OPTS_1 = "enable_content_md5,kernel_cache,max_stat_cache_size=1000000,parallel_count=200,multipart_size=200,singlepart_copy_limit=200,multireq_max=400,max_background=1000"
  //   }
  // ]
  known_hosts_user = "root"
  known_hosts_targets = [
    "bitbucket.org"
  ]
  vault_agent_templates = [
    {
      "name" = "consul-token"
      "template" = "[[ with secret \"consul/creds/${var.env}-{{ vault_consul_role_cluster_type }}-node\" ]][[ .Data.token ]][[ end ]]"
      "destination" = {
        "path" = "/opt/consul/acl-token.txt"
        "setup_parent_directory" = true
        "parent_directory" = {
          "owner" = "consul"
          "group" = "consul"
          "mode"  = ""
        }
      }
      "perms" = "0644"
      "command" = "consul acl set-agent-token -token=`cat /opt/consul/acl-token.txt` agent `cat /opt/consul/acl-token.txt`"
      "left_delimiter" = "[["
      "right_delimiter" = "]]"
    },
  //  {
  //    "name" = "docker-auth"
  //    "template" = "{\"auths\": {\"https://index.docker.io/v1/\": {\"username\": \"[[ with secret \"ops/docker\" ]][[ .Data.data.username ]][[ end ]]\", \"password\": \"[[ with secret \"ops/docker\" ]][[ .Data.data.password ]][[ end ]]\" } } }"
  //    "destination" = {
  //      "path" = "/etc/docker/docker-auth.json"
  //    }
  //    "perms" = "0644"
  //    "left_delimiter" = "[["
  //    "right_delimiter" = "]]"
  //  }
  ]
}

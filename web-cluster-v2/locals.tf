
locals {
  growr_provisioned_disks = [
  //  {
  //    DEVICE_DRIVE              = "sdb"
  //    LABEL                     = "elastic"
  //  }
  ]
  s3_provisioned_disks = []

  nomad_host_volumes = [
    /*
    {
      "name"      = "frank-nfs-dev"
      "path"      = "/mnt/nfs/nonprod/dev/files"
      "owner"     = "root"
      "group"     = "bin"
      "mode"      = "0777"
      "read_only" = "false"
    },
    {
      "name"      = "frank-nfs-test"
      "path"      = "/mnt/nfs/nonprod/test/files"
      "owner"     = "root"
      "group"     = "bin"
      "mode"      = "0777"
      "read_only" = "false"
    },
    {
      "name"      = "frank-nfs-stage"
      "path"      = "/mnt/nfs/nonprod/stage/files"
      "owner"     = "root"
      "group"     = "bin"
      "mode"      = "0777"
      "read_only" = "false"
    },


    // Uncomment this section when deploying for prod
    {
      "name"      = "frank-nomad-prod"
      "path"      = "${data.vault_generic_secret.prod_minio_s3.data["host_mount_path"]}/default/files"
      "owner"     = "root"
      "group"     = "bin"
      "mode"      = "0777"
      "read_only" = "false"
    },
   */
  ]

  known_hosts_user = "root"
  known_hosts_targets = [
    "bitbucket.org"
  ]

  vault_agent_templates = [
    {
      "name" = "consul-token"
      "template" = "[[ with secret \"consul/creds/{{ vault_consul_role_cluster_type }}-node\" ]][[ .Data.token ]][[ end ]]"
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

name                 = "web"
consul_tls_src_files = "/opt/devops-local/ssl/certs"
consul_src_def       = "/opt/devops-local/ssl/certs"
remote_exec_ssh_key_file = "/opt/devops-local/ssl/keys/key.pem"
local_exec_ssh_key_file  = "/opt/devops-local/ssl/keys/key.pem"

provisioned_disks = [
  {
    device_drive              = "sdb"
    label                     = "frank_label"
    disk_size                 = "large"
    thin_provisioned          = "true"
    eagerly_scrub             = "false"
    data_disk_scsi_controller = "0"
  }
]

nomad_vault_tls_skip_verify = "yes"
nomad_options = {
  "driver.raw_exec.enable" = "1"
  "driver.java.enable"     = "0"
  "docker.cleanup.image"   = "false"
  "docker.volumes.enabled" = "true"
}
nomad_host_volumes = [
  {
    "name"      = "frank-nomad"
    "path"      = "/mnt/local/frank_mount/default/files"
    "owner"     = "root"
    "group"     = "bin"
    "mode"      = "0777"
    "read_only" = "false"
  }
]

// https://man7.org/linux/man-pages/man7/capabilities.7.html
// https://www.nomadproject.io/docs/configuration/plugin
nomad_plugins = {
  "docker" = {
    "config" = {
      "auth" = {
        //"config" = "/etc/docker-auth.json"
        "helper" = "vault-login"
      }
      "gc" = {
        "image" = true
      }
      "volumes" = {
        "enabled" = true
      }
    }
  }
}

docker_vault_login = {
  "config_path" = "/etc/vault/agent.hcl"
}

vault_docker_secrets = [
  {
    "registry" = "docker.io"
    "secret"   = "ops/data/docker"
  }
]
remote_exec_user           = "cicduser"
remote_exec_timeout        = "3m"
remote_exec_command        = "echo Running the remote exec provisioner"
local_exec_user            = "cicduser"
path_to_ansible            = "../../ansible-deployments/main.yml"
ansible_python_interpreter = "/usr/bin/python3"

provisioned_disks = []

consul_domain                     = "consul."
consul_group_name                 = "all"
consul_group                      = "consul"
consul_cloud_autodiscovery        = "True"
consul_tls_enable                 = "True"
consul_tls_ca_crt                 = "consul-agent-ca.pem"
consul_tls_verify_incoming        = "False"
consul_tls_verify_outgoing        = "True"
consul_tls_verify_server_hostname = "True"
consul_node_role                  = "client"
consul_connect_enabled            = "True"
consul_syslog_enable              = "True"
consul_acl_enable                 = "True"
consul_acl_default_policy         = "allow"
consul_version                    = "1.10.2"
auto_encrypt                      = { "enabled" = "True" }
consul_ports                      = { "grpc" = "8502", "dns" = "8600", "http" = "8500", "https" = "-1", "rpc" = "8400", "serf_lan" = "8301", "serf_wan" = "8302", "server" = "8300" }

nomad_region                       = "tmi"
nomad_node_class                   = "feature"
nomad_user                         = "nomad"
nomad_group_name                   = "all"
nomad_group                        = "nomad"
nomad_manage_group                 = "yes"
nomad_leave_on_terminate           = "yes"
nomad_leave_on_interrupt           = "yes"
nomad_version                      = "1.1.4"
nomad_vault_enabled                = "True"
nomad_vault_address                = "https://vault.service.consul:8200"
nomad_vault_create_from_role       = "nomad-cluster"
nomad_vault_cert_file              = ""
nomad_vault_key_file               = ""
nomad_vault_tls_skip_verify        = "True"
nomad_telemetry                    = "true"
nomad_telemetry_prometheus_metrics = "true"
nomad_docker_enable                = "yes"
nomad_options = {
  "driver.raw_exec.enable" = "1"
  "driver.java.enable"     = "0"
  "docker.cleanup.image"   = "false"
  "docker.volumes.enabled" = "true"
}
nomad_meta = {
  "node-switcher" = "on"
  "purpose"       = "data"
}

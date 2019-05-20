data_dir = "/etc/nomad.d"
bind_addr = "0.0.0.0" # the default

server {
  enabled          = true
  bootstrap_expect = 1
}

consul {
  # The address to the Consul agent.
  address = "127.0.0.1:8500"

  # The service name to register the server and client with Consul.
  server_service_name = "nomad"
  client_service_name = "nomad-client"

  # Enables automatically registering the services.
  auto_advertise = true

  # Enabling the server and client to bootstrap using Consul.
  server_auto_join = true
  client_auto_join = true
}

vault {
  enabled          = true
  #ca_path          = "/etc/certs/ca"
  #cert_file        = "/var/certs/vault.crt"
  #key_file         = "/var/certs/vault.key"
  address          = "http://127.0.0.1:8200"
  create_from_role = "nomad-cluster"
}
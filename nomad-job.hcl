data_dir  = "/var/lib/nomad"

bind_addr = "0.0.0.0" # the default

advertise {
  # Defaults to the first private IP address.
  http = "1.2.3.4"
  rpc  = "1.2.3.4"
  serf = "1.2.3.4:5648" # non-default ports may be specified
}

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled       = true
  network_speed = 10
  options {
    "driver.raw_exec.enable" = "1"
  }
}

consul {
  address = "127.0.0.1:8500"
}

vault {
  enabled          = true
  #ca_path          = "/etc/certs/ca"
  #cert_file        = "/var/certs/vault.crt"
  #key_file         = "/var/certs/vault.key"
  address          = "http://127.0.0.1:8200"
  create_from_role = "nomad-cluster"
}
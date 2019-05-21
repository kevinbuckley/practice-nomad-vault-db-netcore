datacenter = "dc1"
data_dir   = "/mount/"


client {
  enabled       = true
  network_speed = 10
  options {
    "driver.raw_exec.enable" = "1"
  }
}

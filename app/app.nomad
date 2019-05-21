job "app" {
  datacenters = ["dc1"]

  group "appgroup" {
    task "server" {
      driver = "docker"

      config {
        image = "kbux/kb-dotnet-core-simple:latest"
        args = [ 
          "-p", "8000:80"
        ]
      }

      resources {
        network {
          mbits = 10
          port "http" {
            static = "80"
          }
        }
      }
    }
  }
}
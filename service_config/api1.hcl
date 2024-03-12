# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

service {
  name    = "api1"
  id      = "api1"
  address = "10.5.0.50"
  port = 8080

  tags = ["v1"]
  meta = {
    version = "1"
  }

  connect {
    sidecar_service {
      port = 20000

      check {
        name     = "Connect Envoy Sidecar"
        tcp      = "10.5.0.50:20000"
        interval = "10s"
      }

      proxy {
        upstreams {
          destination_name   = "api2"
          local_bind_address = "127.0.0.1"
          local_bind_port    = 8081

          config {
            connect_timeout_ms = 5000
            limits {
              max_connections         = 3
              max_pending_requests    = 4
              max_concurrent_requests = 5
            }
            passive_health_check {
              interval     = "30s"
              max_failures = 10
            }
          }
        }
      }
    }
  }
}


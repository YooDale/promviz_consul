# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

service {
  name = "nodejs"
  id = "nodejs"
  address = "10.5.0.4"
  port = 3000

  tags = ["v1"]
  meta = {
    version = "1"
  }

  connect {
    sidecar_service {
      port = 20000

      check {
        name     = "Connect Envoy Sidecar"
        tcp      = "10.5.0.4:20000"
        interval = "10s"
      }
    }
  }
}


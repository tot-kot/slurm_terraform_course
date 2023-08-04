labels = {
  "project" = "slurm"
  "env"     = "lab"
}

resources = {
  cpu     = 2
  memory  = 1
  image   = "centos-7"
  disk    = 10
}

vm_count = 3

cidr_blocks = [
  ["10.10.1.0/24"],
  ["10.10.2.0/24"],
  ["10.10.3.0/24"],
]

nlb_port = 80

nlb_healthcheck = {
    name   = "test"
    path   = "/"
}

az = [
  "ru-central1-a",
  "ru-central1-b",
  "ru-central1-c",
]
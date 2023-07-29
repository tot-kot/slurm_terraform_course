labels = {
  "project" = "slurm"
  "env"     = "lab"
}

resources = {
  cpu     = 2
  memory  = 1
  disk    = 10
}

cidr_blocks = [
  ["10.10.1.0/24"],
  ["10.10.2.0/24"],
  ["10.10.3.0/24"],
]

nlb_port = 22

nlb_healthcheck = {
    name   = "test"
    path   = "/"
}
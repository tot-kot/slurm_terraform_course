output "public_ip_instances" {
  value = yandex_compute_instance.this[*].network_interface.0.nat_ip_address
}

output "public_ip_nlb" {
  value = flatten(yandex_lb_network_load_balancer.this.listener[*].external_address_spec.*.address).0
}

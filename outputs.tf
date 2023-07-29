output "public_ip_a" {
  value = yandex_compute_instance.this-a.network_interface.0.nat_ip_address
}

output "public_ip_b" {
  value = yandex_compute_instance.this-b.network_interface.0.nat_ip_address
}

output "public_ip_c" {
  value = yandex_compute_instance.this-c.network_interface.0.nat_ip_address
}

output "public_ip_nlb" {
  value = flatten(yandex_lb_network_load_balancer.this.listener[*].external_address_spec.*.address).0
}
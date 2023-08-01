output "public_ip_a" {
  value = yandex_compute_instance.this[0].network_interface.0.nat_ip_address
}

output "public_ip_b" {
  value = yandex_compute_instance.this[1].network_interface.0.nat_ip_address
}

output "public_ip_c" {
  value = yandex_compute_instance.this[2].network_interface.0.nat_ip_address
}

output "public_ip_nlb" {
  value = flatten(yandex_lb_network_load_balancer.this.listener[*].external_address_spec.*.address).0
}
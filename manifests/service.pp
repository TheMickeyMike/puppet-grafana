# Class: grafana::service
#
#
class grafana::service {
  service { $::grafana::service_name:
    ensure  => running,
    enable  => true,
    require => Package[$::grafana::package_name],
  }
}
# Class: grafana::config
#
#
class grafana::config {
  file {  $::grafana::cfg_location:
  	ensure  => present,
  	content => template('grafana/grafana.ini.erb'),
  }
}
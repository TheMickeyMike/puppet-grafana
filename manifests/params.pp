# Class: grafana::params
#
#
class grafana::params {
	$version      = '3.1.1-1470047149'
	$package_name = 'grafana'
	$service_name = 'grafana-server'
	$cfg_location = '/etc/grafana/grafana.ini'
	$install_dir  = '/tmp'
}
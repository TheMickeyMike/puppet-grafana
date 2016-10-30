# Class: grafana::install
#
#
class grafana::install {
exec { 'Download Grafana package':
    provider => 'shell',
    command => "wget https://grafanarel.s3.amazonaws.com/builds/grafana_${::grafana::version}_amd64.deb",
    cwd     => $::grafana::install_dir,
    creates => "${::grafana::install_dir}/grafana_${::grafana::version}_amd64.deb"
  }

  package { 'adduser':
    ensure => 'installed',
  }

  package { 'libfontconfig':
    ensure => 'installed',
  }

  package {$::grafana::package_name:
    ensure  => present,
    require => Exec['Install Grafana package'],
  }

  exec { 'Install Grafana package':
    provider => 'shell',
    cwd     => $::grafana::install_dir,
    command => "dpkg -i ${::grafana::install_dir}/grafana_${::grafana::version}_amd64.deb",
    unless  => "dpkg -l | grep grafana | grep ${::grafana::version}",
    require => [ Package['adduser'], Package['libfontconfig'] ]
  }
}
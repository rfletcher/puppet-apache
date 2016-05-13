# Class apache::modules::cloudflare
#
# Manage Apache mod_cloudflare
#
class apache::modules::cloudflare {
  include ::apache

  ::apt::source { 'cloudflare':
    ensure   => present,
    location => "http://pkg.cloudflare.com/",
  } ->

  package { 'libapache2-mod-cloudflare':
    ensure          => present,
    install_options => ['--allow-unauthenticated'],
    require         => Class['apt::update'],
  } ->

  file { '/etc/apache2/mods-enabled/cloudflare.conf':
    ensure => absent,
    notify => Service['apache2'],
  }
}

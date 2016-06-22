# Class apache::modules::cloudflare
#
# Manage Apache mod_cloudflare
#
class apache::modules::cloudflare(
  $ensure = 'present'
) {
  include ::apache

  ::apt::key { 'FBA8C0EE63617C5EED695C43254B391D8CACCBF8':
    source => 'https://pkg.cloudflare.com/pubkey.gpg',
  } ->

  ::apt::source { 'cloudflare':
    ensure   => present,
    location => "http://pkg.cloudflare.com/",
  } ->

  package { 'libapache2-mod-cloudflare':
    ensure          => $ensure,
    install_options => ['--allow-unauthenticated'],
    require         => Class['apt::update'],
  } ->

  file { '/etc/apache2/mods-enabled/cloudflare.conf':
    ensure => absent,
    notify => Service['apache2'],
  }
}

# Class apache::modules::cloudflare
#
# Manage Apache mod_cloudflare
#
class apache::modules::cloudflare (
  $source = 'https://www.cloudflare.com/static/misc/mod_cloudflare/ubuntu/mod_cloudflare-precise-amd64.latest.deb',
) {
  include apache

  wget::fetch { $source:
    source      => $source,
    destination => '/tmp/mod_cloudflare.deb',
    timeout     => 0,
    verbose     => false,
  } ->

  package { 'mod_cloudflare':
    ensure   => present,
    provider => 'dpkg',
    source   => '/tmp/mod_cloudflare.deb',
  } ->

  file { '/etc/apache2/mods-enabled/cloudflare.conf':
    ensure => absent,
    notify => Service['apache2'],
  }
}

# Class apache::modules::php
#
# Manage Apache mod_php
#
class apache::modules::php(
  $ensure = present,
) {
  include ::apache

  package { 'libapache2-mod-php':
    ensure  => $ensure,
    require => Class['apt::update'],
  }
}

# Class apache::modules::php
#
# Manage Apache mod_php
#
class apache::modules::php {
  include ::apache

  package { 'libapache2-mod-php':
    ensure  => present,
    require => Class['apt::update'],
  }
}

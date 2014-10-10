# Class apache::modules::passenger
#
# Manage Apache mod_passenger
#
class apache::modules::passenger(
  $ensure        = '4.0.45',
  $ruby_root     = undef,
  $rbenv_root    = undef,
  $ruby_version,
) {
  $is_rbenv = $rbenv_root ? {
    undef   => false,
    default => true,
  }

  $passenger_build_env = $is_rbenv ? {
    true  => "RBENV_VERSION=${ruby_version}",
    false => undef,
  }

  $real_ruby_root = $is_rbenv ? {
    true  => "${rbenv_root}/versions/${ruby_version}",
    false => $ruby_root,
  }

  $passenger_version = $ensure
  $passenger_root = "${real_ruby_root}/lib/ruby/gems/1.9.1/gems/passenger-${passenger_version}"
  $mod_passenger_path = "${passenger_root}/buildout/apache2/mod_passenger.so"

  include apache
  include ruby

  rbenv::gem { "passenger":
    ruby_version => $ruby_version,
    version      => $passenger_version,
  } ->

  # install mod_passenger build dependencies
  package { [
    'libcurl4-openssl-dev',
    'apache2-threaded-dev',
    'libapr1-dev',
    'libaprutil1-dev',
  ]: } ->

  # build mod_passenger
  exec { "build mod_passenger":
    command     => "passenger-install-apache2-module -a --languages ruby",
    creates     => $mod_passenger_path,
    environment => $passenger_build_env,
    timeout     => 600,
  } ->

  file { '/etc/apache2/mods-available/passenger.conf':
    ensure  => present,
    content => "
      PassengerRoot ${passenger_root}
      PassengerDefaultRuby ${real_ruby_root}/bin/ruby
    ",
    notify  => $apache::manage_service_autorestart,
    require => Package['apache'],
  } ->

  file { '/etc/apache2/mods-available/passenger.load':
    ensure  => present,
    content => "LoadModule passenger_module ${mod_passenger_path}\n",
    notify  => $apache::manage_service_autorestart,
    require => Package['apache'],
  } ->

  apache::module { "passenger": }
}

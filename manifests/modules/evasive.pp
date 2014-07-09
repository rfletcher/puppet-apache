# Class apache::modules::evasive
#
# Manage Apache mod_evasive
#
class apache::modules::evasive {
  include apache

  file { "/etc/apache2/mods-available/evasive.load":
    ensure  => present,
    content => "LoadModule evasive20_module /usr/lib/apache2/modules/mod_evasive20.so\n",
    notify  => $apache::manage_service_autorestart,
    require => Package['apache'],
  } ->

  apache::module { 'evasive':
    install_package => true,
  }
}

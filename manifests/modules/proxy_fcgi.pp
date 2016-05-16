# Class apache::modules::proxy_fcgi
#
# Manage Apache mod_proxy_fcgi
#
class apache::modules::proxy_fcgi {
  include ::apache::modules::proxy

  apache::module { 'proxy_fcgi':
    ensure => present,
  }
}

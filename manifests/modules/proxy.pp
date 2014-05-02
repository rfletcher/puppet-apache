# Class apache::modules::proxy
#
# Manage Apache mod_proxy and company
#
class apache::modules::proxy {
  apache::module { [
    'proxy',
    'proxy_http',
  ]:
    ensure => present,
  }
}

# Class apache::modules::proxy_html
#
# Manage Apache mod_proxy_html
#
class apache::modules::proxy_html {
  include ::apache::modules::proxy

  apache::module { 'proxy_html':
    ensure          => present,
    install_package => 'proxy-html',
  }
}

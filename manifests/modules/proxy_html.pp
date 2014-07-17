# Class apache::modules::proxy_html
#
# Manage Apache mod_proxy_html
#
class apache::modules::proxy_html {
  apache::module { 'proxy_html':
    ensure          => present,
    install_package => 'proxy-html',
  }
}

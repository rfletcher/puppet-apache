# Class apache::modules::ssl
#
# Manage Apache mod_ssl
#
class apache::modules::ssl {
  apache::module { 'ssl':
    ensure => present,
  }
}

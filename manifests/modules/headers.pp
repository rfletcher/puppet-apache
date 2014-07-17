# Class apache::modules::headers
#
# Manage Apache mod_headers
#
class apache::modules::headers {
  apache::module { 'headers':
    ensure => present,
  }
}

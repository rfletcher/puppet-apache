# Class apache::modules::status
#
# Manage Apache mod_status
#
class apache::modules::status {
  apache::module { 'status':
    ensure => present,
  }
}

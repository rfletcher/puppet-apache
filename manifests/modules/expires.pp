# Class apache::modules::expires
#
# Manage Apache mod_expires
#
class apache::modules::expires {
  apache::module { 'expires':
    ensure => present,
  }
}

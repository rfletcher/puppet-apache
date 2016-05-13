# Class apache::modules::version
#
# Manage Apache mod_version
#
class apache::modules::version {
  apache::module { 'version':
    ensure => present,
  }
}

# Class apache::modules::rewrite
#
# Manage Apache mod_rewrite
#
class apache::modules::rewrite {
  apache::module { 'rewrite':
    ensure => present,
  }
}

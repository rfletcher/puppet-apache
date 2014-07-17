# Class apache::modules::evasive
#
# Manage Apache mod_evasive
#
class apache::modules::evasive {
  apache::module { 'mod-evasive':
    ensure          => present,
    install_package => 'evasive',
  }
}

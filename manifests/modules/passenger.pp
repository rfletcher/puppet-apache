# Class apache::modules::passenger
#
# Manage Apache mod_passenger
#
class apache::modules::passenger {
  apache::module { 'passenger':
    install_package => true,
  }
}

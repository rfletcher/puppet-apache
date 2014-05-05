# Class apache::modules::wsgi
#
# Manage Apache mod_wsgi
#
class apache::modules::wsgi {
  apache::module { 'wsgi':
    install_package => true,
  }
}

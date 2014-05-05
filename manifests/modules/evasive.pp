# Class apache::modules::evasive
#
# Manage Apache mod_evasive
#
class apache::modules::evasive {
  # the package fails to install a load file, so we have to do a little extra work
  $mods_dir = "/etc/apache2/mods-available"

  exec { "mkdir -p ${mods_dir}": } ->

  file { "${mods_dir}/evasive.load":
    ensure  => present,
    content => 'LoadModule evasive20_module /usr/lib/apache2/modules/mod_evasive20.so',
  } ->

  apache::module { 'evasive':
    install_package => true,
  }
}

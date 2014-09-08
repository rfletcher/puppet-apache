# Class apache::modules::status
#
# Manage Apache mod_status
#
class apache::modules::status(
  $templatefile = undef,
) {
  apache::module { 'status':
    ensure       => present,
    templatefile => $templatefile ? { undef => '', default => $templatefile }
  }
}

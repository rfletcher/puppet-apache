# = Define: apache::proxy
#
# Sets up a simple virtual host to forward <name>:80 to <name>:<port>
#
# == Parameters:
#
# [*port*]
#   The port to configure the host on
#
define apache::proxy (
  $port,
  $ssl    = false,
  $target = 'localhost',
) {
  include ::apache::modules::proxy

  apache::vhost { $title:
    content => template( 'apache/virtualhost/proxy.conf.erb' ),
  }
}

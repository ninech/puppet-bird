class bird (
  String $router_id,
  String $kernel_table      = $bird::params::kernel_table,
  String $direct_interfaces = $bird::params::direct_interfaces,
) inherits bird::params {

  class { 'bird::install': } ->
  class { 'bird::config': } ~>
  class { 'bird::service': }

  contain bird::install
  contain bird::config
  contain bird::service

}


class bird (
  String        $router_id,
  String        $source,
  String        $source6,
  String        $kernel_table      = $bird::params::kernel_table,
  Array[String] $direct_interfaces = $bird::params::direct_interfaces,
) inherits bird::params {

  class { 'bird::install': } ->
  class { 'bird::config': } ~>
  class { 'bird::service': }

  contain bird::install
  contain bird::config
  contain bird::service

}


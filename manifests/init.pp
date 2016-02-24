class bird (
  String $router_id,
) inherits bird::params {

  class { 'bird::install': } ->
  class { 'bird::config': } ~>
  class { 'bird::service': }

  contain bird::install
  contain bird::config
  contain bird::service

}


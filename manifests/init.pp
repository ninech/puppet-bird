class bird (
  String $router_id,
) inherits bird::params {

  contain bird::install
  contain bird::config
  contain bird::service

  class { '::bird::install': } ->
  class { '::bird::config': } ~>
  class { '::bird::service': } ->

}


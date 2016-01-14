class bird (
  String[7,15]   $router_id,
  Integer[0]     $local_as,
  Array[String]  $self_net,
  Array[String]  $self_public,
  Array[String]  $self_net_public,
  Array[String]  $self_net6,
  Array[String]  $self_public6,
  Array[String]  $self_net_public6,
  Array[String]  $freifunk_net  = $bird::params::freifunk_net,
  Array[String]  $freifunk_net6 = $bird::params::freifunk_net6,
  Integer[0,255] $kernel_table  = $bird::params::kernel_table,
) inherits bird::params {

  # TODO: Array network syntax validation

  # The + makes bird recognize every containing subnet.
  $self_net_plus         = $self_net.map | $value | { $value + '+' }
  $self_public_plus      = $self_public.map | $value | { $value + '+' }
  $self_net_public_plus  = $self_net_public.map | $value | { $value + '+' }

  $self_net6_plus        = $self_net6.map | $value | { $value + '+' }
  $self_public6_plus     = $self_public6.map | $value | { $value + '+' }
  $self_net_public6_plus = $self_net_public6.map | $value | { $value + '+' }

  contain bird::install
  contain bird::config
  contain bird::service

  class { '::bird::install': } ->
  class { '::bird::config': } ~>
  class { '::bird::service': } ->

}


# == Class: telegraf
#
# Install the InfluxDBs telegraf
#
# === Parameters
#
# [*ensure*]
#  handle installation, activation or purging of bird
#
# [*version*]
#  handle version of bird
#
# [*router_id*]
#
#
# [*source*]
#
#
# [*source6*]
#
#
# [*kernel_table*]
#
#
# [*direct_interface*]
#
#
# === Authors
#
# Simon Kurka (https://github.com/simonkurka)
# Roman Plessl <roman.plessl@nine.ch>
#
# === Copyright
#
# Copyirght 2016 Simon Kurka (https://github.com/simonkurka)
# Copyright 2016 Nine Internet Solutions AG, Roman Plessl
#
class bird (
  $router_id,
  $source,
  $source6,
  $kernel_table      = $::bird::params::kernel_table,
  $direct_interfaces = $::bird::params::direct_interfaces,
) inherits ::bird::params
{

  class { '::bird::install': } ->
  class { '::bird::config': } ~>
  class { '::bird::service': }

  contain bird::install
  contain bird::config
  contain bird::service

}


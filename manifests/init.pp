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
  $source            = $::bird::params::source,
  $source6           = $::bird::params::source6,
  $ensure            = $::bird::params::ensure,
  $version           = $::bird::params::version,
  $kernel_table      = $::bird::params::kernel_table,
  $direct_interfaces = $::bird::params::direct_interfaces,
  $logfile           = $::bird::params::logfile,
  $logfile_owner     = $::bird::params::logfile_owner,
  $logfile_group     = $::bird::params::logfile_group,
  $user              = $::bird::params::user,
  $group             = $::bird::params::group,
) inherits ::bird::params
{

  class { '::bird::install': } ->
  class { '::bird::config': } ~>
  class { '::bird::service': }

  contain bird::install
  contain bird::config
  contain bird::service

}


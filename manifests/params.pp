# == Class: bird::params
#
# This class is called from bird for defaults.
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
class bird::params {
  $ensure             = 'installed'
  $version            = '1.5.0-4'
  $service_ensure     = 'running',
  $service_enable     = true,
  #
  $config_template_v4 = 'bird/bird.conf.erb'
  $config_template_v6 = 'bird/bird6.conf.erb'
  #
  $source             = '10.42.42.1'
  $source6            = 'fd6a:fbee:cc95:df4d::1'
  #
  $kernel_table       = undef
  $direct_interfaces  = [ '*' ]
  #
  $logfile            = '/var/log/bird.log'
  $logfile_user       = 'bird'
  $logfile_group      = 'adm'
  #
  $user               = 'bird'
  $group              = 'bird'
}

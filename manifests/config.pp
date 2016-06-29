# == Class: bird::config
#
# This class is called from bird for configuration.
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
class bird::config inherits bird {

  file {
    '/etc/bird/bird.conf.d/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird.conf':
      ensure  => file,
      mode    => '0644',
      content => template($::bird::config_template_v4),
  }

  file {
    '/etc/bird/bird6.conf.d/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird6.conf':
      ensure  => file,
      mode    => '0644',
      content => template($::bird::config_template_v6),
  }

}

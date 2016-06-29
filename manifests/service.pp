# == Class: bird::service
#
# This class is called from bird for service handling.
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
class bird::service inherits bird {

  case $::operatingsystem {
    'Debian': {
      service { 'bird':
        ensure      => 'running',
        enable      => true,
        hasstatus   => false,
        restart     => '/usr/sbin/birdc configure',
        require     => Package['bird'],
        subscribe   => File['/etc/bird/bird.conf'];
      }
      service { 'bird6':
        ensure      => 'running',
        enable      => true,
        hasstatus   => false,
        restart     => '/usr/sbin/birdc6 configure',
        require     => Package['bird6'],
        subscribe   => File['/etc/bird/bird6.conf'];
      }
    }
    'Ubuntu': {
      service { 'bird':
        ensure      => 'running',
        enable      => true,
        hasstatus   => false,
        restart     => '/usr/sbin/birdc configure',
        require     => Package['bird'],
        subscribe   => File['/etc/bird/bird.conf'];
      }
    }
    default: {
      fail("Bird not supported on ${::operatingsystem} - Only Debian and Ubuntu are supported at this time")
    }
  }
}

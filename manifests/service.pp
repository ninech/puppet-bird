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

  # map the word 'unmanaged' to an undef state so that we can control
  # what puppet should manage
  $service_ensure = $::bird::service_ensure ? {
    'unmanaged' => undef,
    default     => $::bird::service_ensure,
  }

  $service_enable = $::bird::service_enable ? {
    'unmanaged' => undef,
    default     => $::bird::service_enable,
  }

  case $::operatingsystem {
    'Debian': {
      service { 'bird':
        ensure    => $service_ensure,
        enable    => $service_enable,
        hasstatus => true,
        restart   => '/usr/sbin/birdc configure',
        require   => Package['bird'],
        subscribe => File['/etc/bird/bird.conf'];
      }
      service { 'bird6':
        ensure    => $service_ensure,
        enable    => $service_enable,
        hasstatus => true,
        restart   => '/usr/sbin/birdc6 configure',
        require   => Package['bird6'],
        subscribe => File['/etc/bird/bird6.conf'];
      }
    }
    'Ubuntu': {
      service { 'bird':
        ensure    => $service_ensure,
        enable    => $service_enable,
        hasstatus => true,
        restart   => '/usr/sbin/birdc configure',
        require   => Package['bird'],
        subscribe => File['/etc/bird/bird.conf'];
      }
    }
    default: {
      fail("Bird not supported on ${::operatingsystem} - Only Debian and Ubuntu are supported at this time")
    }
  }

  # activate PID
  file_line { 'bird_pid':
    path  => '/etc/bird/envvars',
    line  => 'BIRD_ARGS=\'-P /var/run/bird/bird.pid\'',
    match => '^BIRD_ARGS=';
  }

  # allow write permissions for logfiles and rotate logfile
  if $bird::logfile {
    file {
      $bird::logfile:
        ensure => present,
        owner  => $::bird::logfile_user,
        group  => $::bird::logfile_group;
      '/etc/logrotate.d/bird':
        content => template('bird/logrotate.conf.erb');
    }

  }

}

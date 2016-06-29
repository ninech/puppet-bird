# == Class: bird::install
#
# This class is called from bird for install.
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
class bird::install inherits bird {
  $package_ensure = $::bird::ensure
  case $package_ensure {
    true:     {
      $my_package_ensure = 'present'
    }
    false:    {
      $my_package_ensure = 'absent'
    }
    default:  {
      $my_package_ensure = $package_ensure
    }
  }

  # make sure the specific version is installed
  if $my_package_ensure =~ /present|installed/ {
    $ensure_version = $::bird::version ? {
      undef   => $my_package_ensure,
      default => $::bird::version,
    }
  } else {
    $ensure_version = $my_package_ensure
  }

  # install / purge the package
  case $::operatingsystem {
    'Debian': {
      package { 'bird':
        ensure => $ensure_version,
      }
      package { 'bird6':
        ensure => $ensure_version,
      }
    }
    'Ubuntu': {
      package { 'bird':
        ensure => $ensure_version,
      }
    }
    default: {
      fail("Bird not supported on ${::operatingsystem} - Only Debian and Ubuntu are supported at this time")
    }
  }

}

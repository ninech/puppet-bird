class bird::service inherits bird {

  service {
    'bird':
      ensure      => 'running',
      enable      => true,
      hasstatus   => false,
      restart     => '/usr/sbin/birdc configure',
      require     => Package['bird'],
      subscribe   => File['/etc/bird/bird.conf'];
  }

  service {
    'bird6':
      ensure      => 'running',
      enable      => true,
      hasstatus   => false,
      restart     => '/usr/sbin/birdc6 configure',
      require     => Package['bird6'],
      subscribe   => File['/etc/bird/bird6.conf'];
  }

}

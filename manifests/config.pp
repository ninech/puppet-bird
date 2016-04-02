class bird::config inherits bird {

  include router

  file {
    '/etc/bird/bird.conf.d/':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root;
    '/etc/bird/bird.conf':
      ensure  => file,
      mode    => '0644',
      content => epp('bird/bird.conf.epp', {
        router_id         => $router_id,
        kernel_table      => $kernel_table,
        direct_interfaces => $direct_interfaces,
        source            => $source,
      });
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
      content => epp('bird/bird6.conf.epp', {
        router_id         => $router_id,
        kernel_table      => $kernel_table,
        direct_interfaces => $direct_interfaces,
        source6           => $source6,
      });
  }

}

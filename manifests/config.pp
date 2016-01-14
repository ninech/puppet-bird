class bird::config inherits bird {

  file {
    '/etc/bird/bird.conf.d/':
      ensure => directory,
      mode => "0755",
      owner => root,
      group => root;
    '/etc/bird/bird.conf':
      ensure => file,
      mode => "0644",
      content => epp("bird/bird.conf.epp"),
  }

  file {
    '/etc/bird/bird6.conf.d/':
      ensure => directory,
      mode => "0755",
      owner => root,
      group => root;
    '/etc/bird/bird6.conf':
      ensure => file,
      mode => "0644",
      content => epp("bird/bird6.conf.epp"),
  }

}

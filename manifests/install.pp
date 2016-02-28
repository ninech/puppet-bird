class bird::install inherits bird {

  package { 'bird': ensure => 'installed' }
  package { 'bird6': ensure => 'installed' }

}

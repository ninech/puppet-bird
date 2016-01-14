define bird::peer6 (
  String  $template,
  String  $source_address,
  String  $neighbor_address,
  Integer $neighbor_as,
) {
  file {
    '/etc/bird/peer6.d/${title}.conf':
      ensure => file,
      mode => "0644",
      content => epp("bird/peer.conf.epp");
  }
}

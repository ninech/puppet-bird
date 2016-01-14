define bird::peer (
  String  $template,
  String  $source_address,
  String  $neighbor_address,
  Integer $neighbor_as,
) {
  file {
    '/etc/bird/peer.d/${title}.conf':
      ensure => file,
      mode => "0644",
      content => epp("bird/peer.conf.epp");
  }
}

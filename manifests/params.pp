class bird::params {

  $freiunk_net   = [ '10.0.0.0/8+',
                     '172.16.0.0/12+',
                     '104.0.0.0/8+' ]
  $freifunk_net6 = [ 'fc00::/7{48,64}',
                     '2001:bf7::/32+',    # Förderverein Freie Netzwerke e. V.
                     '2a03:2260::/29+' ]  # Freifunk Rheinland e. V.
  $kernel_table  = 42

}

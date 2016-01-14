# puppet-bird

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with bird](#setup)
    * [Beginning with bird](#beginning-with-bird)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module manages bird for the Freifunk Nordwest network.

The module creates configuration for BGP with uplinks, IC-VPN, and internal purposes (iBGP) as well as OSPF for network internal routing.

## Setup

### Beginning with bird

To setup this module call the bird class and set some parameters. Afterwards several BGP peerings and OSPF can be set up (TODO).
```puppet
class { '::bird':
  router_id => '10.18.16.1',
  local_as => 65513,
  self_net => [ '10.18.0.0/16' ],
  self_public => [ '185.66.195.2/32' ],
  self_net_public => [ '185.66.195.2/31' ],
  self_net6 => [ 'fd74:fdaa:9dc4::/48' ],
  self_public6 => [ '2a03:2260:1001:1000::/54' ],
  self_net_public6 => [ '2a03:2260:1001::/48' ],
}
```

## Usage

```puppet
class { '::bird':
  router_id => '10.18.16.1',
  local_as => 65513,
  self_net => [ '10.18.0.0/16' ],
  self_public => [ '185.66.195.3/32' ],
  self_net_public => [ '185.66.195.2/31' ],
  self_net6 => [ 'fd74:fdaa:9dc4::/48' ],
  self_public6 => [ '2a03:2260:1001:1000::/54' ],
  self_net_public6 => [ '2a03:2260:1001::/48' ],
}

bird::peer ( 'ffrl-ber-a':
  template => 'uplink',
  source_address => '100.64.0.45',
  neighbor_address => '100.64.0.44',
  neighbor_as => 201701,
)

bird::peer ( 'ffrl-dus-a':
  template => 'uplink',
  source_address => '100.64.0.47',
  neighbor_address => '100.64.0.46',
  neighbor_as => 201701,
)

bird::peer6 ( 'ffrl-ber-a':
  template => 'uplink',
  source_address => '2a03:2260:0:1e::2',
  neighbor_address => '2a03:2260:0:1e::1',
  neighbor_as => 201701,
)

bird::peer6 ( 'ffrl-dus-a':
  template => 'uplink',
  source_address => '2a03:2260:0:1f::2',
  neighbor_address => '2a03:2260:0:1f::1',
  neighbor_as => 201701,
)
```

## Reference

* class bird
  * $router\_id
  * $local\_as
  * $self\_net
  * $self\_public
  * $self\_net\_public
  * $self\_net6
  * $self\_public6
  * $self\_net\_public6
  * $freiunk\_net (optional, default see manifests/params.pp)
  * $freiunk\_net6 (optional, default see manifests/params.pp)
  * $kernel\_table (optional, default 42)
* define bird::peer
  * template
  * source\_address
  * neighbor\_address
  * neighbor\_as
* define bird::peer6
  * template
  * source\_address
  * neighbor\_address
  * neighbor\_as

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.


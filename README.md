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

This module creates a configuration structure for the bird routing daemon.

## Setup

### Beginning with bird

To setup this module call the bird class and set the router id. Other modules can be set up on top of this using configuration files in /etc/bird/bird.conf.d/ or /etc/bird/bird6.conf.d/.

```puppet
class { '::bird':
  router_id => '10.18.16.1',
  source    => '10.18.1.2',
  source6   => 'fd74:fdaa:9dc4:102::1',
}
```

## Usage

```puppet
class { '::bird':
  router_id => '10.18.16.1',
  source    => '10.18.1.2',
  source6   => 'fd74:fdaa:9dc4:102::1',
}
```

## Reference

* class bird
  * router_id
  * source
  * source6
  * kernel_table (optional, default '42')
  * direct_interfaces (optional, default [ '*' ])

## Limitations

### OS compatibility
* Debian 8
* Ubuntu 14.04 and 16.04

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.


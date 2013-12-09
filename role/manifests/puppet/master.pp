# == Class role::pupet::master
#
#
class role::puppet::master {
  class {
    'profile::puppet::master':
      require => Class['profile::zabbix::agent'];
    'profile::zabbix::agent':
  }
}

# == Class role::pupet::master
#
#
class role::puppet::master {
  class { 'profile::puppet::master': }
}

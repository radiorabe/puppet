# = Class: profile::puppet::master
#
# Set up a puppet master that uses couch for assigning profiles and configuration data.
# This master also uses jabber for reporting to a muc.
#
class profile::puppet::master {

  class {
    'activerecord':
      ;
    'xmpp':
      package_name => 'xmpp4r',
      xmpp_jid      => hiera('puppet_xmpp_jid'),
      xmpp_password => hiera('puppet_xmpp_password'),
      xmpp_muc      => hiera('puppet_xmpp_muc'),
      xmpp_target   => hiera('puppet_xmpp_target');
    'puppet':
      master  => hiera('puppet_master');
    'puppet::couch':
      url     => hiera('puppet_couch_classifierdb'),
      require => Class['puppet'];
    'puppet::storeconfig':
      require => [
        Class['puppet'],
        Class['activerecord']
      ];
    '::puppet::master':
      require => [
        Class['puppet'],
        Class['xmpp']
      ];
  }
}

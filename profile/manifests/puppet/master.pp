# = Class: profile::puppet::master
#
# Set up a puppet master that uses couch for assigning profiles and configuration data.
# This master also uses jabber for reporting to a muc.
#
# Due to the age of the puppet module this profile needs some configuration in the global
# scope. Please return these global params from your ENC.
#
# ````
#   "puppet_server": "puppet-master.example.com",
#   "puppet_master": "true",
#   "puppet_storeconfig_provider": "activerecord",
#   "puppet_storeconfig_db_adapter": "mysql",
#   "puppet_storeconfig_db_user": "root",
#   "puppet_storeconfig_db_password": "",
#   "puppet_storeconfig_db_server": "puppet-mysql.example.com",
#   "puppet_storeconfig_db_name": "puppet",
#   "puppet_pluginsync": "true"
# ````
#
# You might also consider refactoring the puppet module to get rid of these.
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

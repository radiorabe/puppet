require 'spec_helper'

describe 'role::puppet::master' do
  it {
    should contain_class('profile::puppet::master')
    should contain_class('profile::zabbix::agent').that_comes_before('Class[profile::puppet::master]')
  }
end

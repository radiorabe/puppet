require 'spec_helper'

describe 'profile::zabbix::agent' do
  context 'install and configure agent' do
    it { should contain_class('zabbix') }
  end
end

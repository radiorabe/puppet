require 'spec_helper'

describe 'profile::puppet::master' do
  it {
    should contain_class('activerecord')
    should contain_class('activerecord').that_comes_before('Class[puppet::storeconfig]')
    should contain_class('puppet')
    should contain_class('puppet::couch').that_requires('Class[puppet]').with_url('http://puppet-couch.example.com:5984/puppet')
    should contain_class('puppet::storeconfig').that_requires('Class[puppet]')
    should contain_class('puppet::master').that_requires('Class[puppet]')
  }
end

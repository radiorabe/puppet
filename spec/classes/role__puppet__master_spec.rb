require 'spec_helper'

describe 'role::puppet::master' do
  it {
    should contain_class('profile::puppet::master')
  }
end

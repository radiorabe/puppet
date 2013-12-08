require 'spec_helper'

describe 'profile::puppet::master' do
  it {
    should contain_class('puppet')
  }
end

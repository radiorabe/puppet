require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

Puppet::Util::Log.level = :debug
Puppet::Util::Log.newdestination(:console)

RSpec.configure do |c|
  c.filter_run_excluding :broken => true
  c.hiera_config = 'hiera.yaml'
end


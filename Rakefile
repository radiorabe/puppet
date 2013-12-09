require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'

desc "Check puppet manifests with puppet-lint"
task :lint do
  require 'puppet-lint/tasks/puppet-lint'
  PuppetLint.configuration.ignore_paths = ["spec/fixtures/**/**/*.pp"]
end


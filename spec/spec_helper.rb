require 'test/unit'
require 'mocha/setup'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'puppet/indirector/data_binding/hiera'
require 'hiera'
require 'rspec_junit_formatter'
require 'simplecov'
require 'simplecov-rcov'
require 'rspec-puppet-utils'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start
fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# include common helpers
support_path = File.expand_path(File.join(File.dirname(__FILE__), '..',
                                          'spec/support/*.rb'))
Dir[support_path].each {|f| require f}

RSpec.configure do |c|
  c.config = '/doesnotexist'
  c.hiera_config = File.join(File.dirname(__FILE__), '..', '..', 'hiera.yaml')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.mock_with :mocha
end
at_exit { RSpec::Puppet::Coverage.report! }

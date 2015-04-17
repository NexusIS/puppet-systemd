require 'rake'
require 'rake/tasklib'
require 'rspec/core/rake_task'
require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint'

desc "Run the tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = ['--color', '-f RspecJunitFormatter', '-o junit.xml']
  t.pattern = 'spec/*/*_spec.rb'
end

desc 'Run puppet-lint on the manifests'
task :lint do
  PuppetLint.configuration.with_filename = true

  linter = PuppetLint.new
  matched_files = FileList['spec/fixtures/modules/**/manifests/**/*.pp']

  matched_files.to_a.each do |puppet_file|
    linter.file = puppet_file
    linter.run
  end

  fail if linter.errors? || (
    linter.warnings? && PuppetLint.configuration.fail_on_warnings
    )
end

task :default => [:spec_prep, :test, :lint, :spec_clean]

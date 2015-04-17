require 'spec_helper'

describe Puppet::Type.type(:systemctl) do


  context 'on all RHEL 7 OSes' do
    let :facts do
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '7',
      }
    end
    before :each do
      @provider_class = described_class.provide(:simple) do
        mk_resource_methods
        def create; end
        def delete; end
        def exists?; end
        def self.isenabled; end
        def self.status; end
      end
    end
    
    ['enable', 'disable', 'start', 'stop', 'restart', 'try-restart', 'reload', 'reload-or-restart', 'reload-or-try-restart'].each do |command|
      it "#{command} should work" do
        c = described_class.new(:name => 'myservice',
                                :command => command)
      end
    end
  end
end

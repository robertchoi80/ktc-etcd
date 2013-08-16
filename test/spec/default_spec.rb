require 'chefspec'

describe 'ktc-etcd::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'ktc-etcd::default' }
end

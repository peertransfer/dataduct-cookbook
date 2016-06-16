require_relative '../spec_helper'

describe 'dataduct::default' do
  cached(:subject) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  let(:node) { subject.node }

  it { is_expected.to include_recipe('build-essential') }

  it { is_expected.to install_package('libpq-dev') }

  it { is_expected.to install_package('libmysqlclient-dev') }

  it 'installs python using poise-python cookbook' do
    is_expected.to install_python_runtime('2')
  end

  it 'installs requests and dataduct python packages' do
    is_expected.to install_python_package('requests')
    is_expected.to install_python_package('dataduct')
  end
end

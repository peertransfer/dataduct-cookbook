require_relative '../spec_helper'

describe 'dataduct-test::default' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: ['dataduct'])
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }

  it { is_expected.to include_recipe('build-essential') }

  it { is_expected.to install_package('libmysqlclient-custom-dev') }
  it { is_expected.to install_package('libpq-custom-dev') }

  it 'installs python using poise-python cookbook' do
    is_expected.to install_python_runtime('3')
  end

  it 'installs requests and dataduct python packages' do
    is_expected.to install_python_package('requests')
    is_expected.to install_python_package('dataduct')
  end
end

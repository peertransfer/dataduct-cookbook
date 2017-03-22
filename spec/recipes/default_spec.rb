require_relative '../spec_helper'

describe 'dataduct-test::default' do
  cached(:subject) do
    runner = ChefSpec::SoloRunner.new(step_into: %w(dataduct dataduct_config))
    runner.converge(described_recipe)
  end
  let(:node) { subject.node }

  context 'dataduct' do
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

  context 'dataduct_config' do
    it 'creates config with specified values' do
      is_expected.to render_file('/etc/dataduct.cfg').with_content('INSTANCE_TYPE: m3.xlarge')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('ETL_AMI: ami-4d089d5a')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('SECURITY_GROUP_ID: sg-ojete')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('SUBNET_ID: subnet-calor')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('S3_ETL_BUCKET: bucket-molon')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('ROLE: DataPipelineRole')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('RESOURCE_ROLE: datapipe')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('S3_BASE_PATH: staging')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('HOST: almendra')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('PASSWORD: secure_password')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('USERNAME: mysql_user')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('CLUSTER_ID: funny_cluster_name')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('DATABASE_NAME: funny_database_name')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('HOST: redshift_hostname')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('PASSWORD: supersecureredshiftpassword')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('USERNAME: redshiftuser')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('S3_BASE_PATH: staging')
      is_expected.to render_file('/etc/dataduct.cfg').with_content('mysql_host_identifier')

      is_expected.to render_file('/etc/dataduct.cfg').with_content('command: dataduct config sync_from_s3 ~/.dataduct/dataduct.cfg')
    end
  end
end

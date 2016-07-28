resource_name 'dataduct'

property :python_runtime_version, String, default: '2'
property :mysql_dev_package, String, default: 'libmysqlclient-dev'
property :postgres_dev_package, String, default: 'libpq-dev'

property :ec2_instance_type, String, default: 'm3.xlarge'

property :ec2_ami, String, default: 'ami-4d089d5a'

property :ec2_security_group_id, String

property :ec2_subnet_id, String

default_action :install

action :install do
  include_recipe 'build-essential'

  package mysql_dev_package
  package postgres_dev_package

  python_runtime python_runtime_version

  python_package 'dataduct'
  python_package 'requests'
end

action :config do
  template '/etc/dataduct.cfg' do
    source 'dataduct.cfg.erb'
    user 'root'
    group 'root'
    mode '600'
    variables(
      ec2_instance_type: ec2_instance_type,
      ec2_ami: ec2_ami,
      ec2_security_group_id: ec2_security_group_id
    )
  end
end

resource_name 'dataduct'

property :python_runtime_version, String, default: '2'
property :mysql_dev_package, String, default: 'libmysqlclient-dev'
property :postgres_dev_package, String, default: 'libpq-dev'

action :install do
  include_recipe 'build-essential'

  package mysql_dev_package
  package postgres_dev_package

  python_runtime python_runtime_version

  python_package 'dataduct'
  python_package 'requests'
end

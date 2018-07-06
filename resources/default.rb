resource_name 'dataduct'

property :python_runtime_version, String, default: '2'
property :mysql_dev_package, String, default: 'libmysqlclient-dev'
property :postgres_dev_package, String, default: 'libpq-dev'
property :python_pip_dataduct_pkg, String, default: 'dataduct'

default_action :install

action :install do
  include_recipe 'build-essential'

  package new_resource.mysql_dev_package
  package new_resource.postgres_dev_package

  python_runtime new_resource.python_runtime_version

  python_package new_resource.python_pip_dataduct_pkg
  python_package 'requests'
end

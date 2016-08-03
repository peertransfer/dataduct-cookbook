dataduct Cookbook
========================

Installs [dataduct](https://github.com/coursera/dataduct)

Requirements
------------

- Python runtime
- Chef 12

Usage
-----

#### dataduct::default

Just include `dataduct` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dataduct]"
  ]
}
```

Providers
---------

**dataduct**

```ruby
dataduct 'default' do
  python_runtime_version '2'
  mysql_dev_package 'libmysqlclient-dev'
  postgres_dev_package 'libpq-dev'
  action :install
end
```
```ruby
dataduct_config 'default' do
  ec2_security_group_id 'sg-ojete'
  ec2_subnet_id 'subnet-calor'
  s3_etl_bucket 'bucket-molon'
  s3_base_path 'staging'
  etl_role 'DataPipelineRole'
  resource_role 'datapipe'
  mysql_host 'almendra'
  mysql_password 'secure_password'
  mysql_username 'mysql_user'
  redshift_cluster_name 'funny_cluster_name'
  redshift_database_name 'funny_database_name'
  redshift_host 'redshift_hostname'
  redshift_password 'supersecureredshiftpassword'
  redshift_user 'redshiftuser'
end
```

Where:
- `python_runtime_version`: Is the major Python runtime version
- `mysql_dev_package`: Is the system package containing MySQL headers
- `postgres_dev_package`: Is the system package containing PostgreSQL headers

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors:
  - Vicente Dominguez <vicendominguez@users.noreply.github.com>
  - Jose Luis Salas <josacar@users.noreply.github.com>
  - Omar Lopez <pollosp@users.noreply.github.com>

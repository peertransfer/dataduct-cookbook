dataduct 'default' do
  python_runtime_version '3'
  mysql_dev_package 'libmysqlclient-custom-dev'
  postgres_dev_package 'libpq-custom-dev'
end

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

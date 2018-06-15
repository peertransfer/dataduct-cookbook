dataduct_config 'default' do
  ec2_security_group_id 'sg-ojete'
  ec2_subnet_id 'subnet-calor'
  s3_etl_bucket 'bucket-molon'
  s3_base_path 'staging'
  etl_role 'DataPipelineRole'
  resource_role 'datapipe'
  mysql_host_id 'mysql_host_identifier'
  mysql_host 'almendra'
  mysql_password 'secure_password'
  mysql_username 'mysql_user'
  redshift_cluster_name 'funny_cluster_name'
  redshift_database_name 'funny_database_name'
  redshift_host 'redshift_hostname'
  redshift_password 'supersecureredshiftpassword'
  redshift_user 'redshiftuser'
  config_sync_from_s3 true

  sns_topic_arn_warning 'arn:aws:sns:us-west-1:123456789012:my_warning_topic'
  sns_topic_arn_failure 'arn:aws:sns:us-west-1:123456789012:my_failure_topic'
end

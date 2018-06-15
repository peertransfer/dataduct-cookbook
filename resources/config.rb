resource_name 'dataduct_config'

property :ec2_instance_type, String, default: 'm3.xlarge'
property :ec2_ami, String, default: 'ami-4d089d5a'
property :ec2_security_group_id, String
property :ec2_subnet_id, String
property :s3_etl_bucket, String
property :etl_role, String
property :resource_role, String
property :s3_base_path, String
property :mysql_host_id, String
property :mysql_host, String
property :mysql_password, String
property :mysql_username, String
property :redshift_cluster_name, String
property :redshift_database_name, String
property :redshift_host, String
property :redshift_password, String
property :redshift_user, String
property :config_sync_from_s3, [TrueClass, FalseClass], default: false
property :cookbook, String, default: 'dataduct'
property :sns_topic_arn_failure, String, required: false, regex: /arn:aws:sns:.*/
property :sns_topic_arn_warning, String, required: false, regex: /arn:aws:sns:.*/

default_action :create

action :create do
  template '/etc/dataduct.cfg' do
    source 'dataduct.cfg.erb'
    user 'root'
    group 'root'
    mode '600'
    variables(
      redshift_password: new_resource.redshift_password,
      redshift_user: new_resource.redshift_user,
      redshift_cluster_name: new_resource.redshift_cluster_name,
      redshift_database_name: new_resource.redshift_database_name,
      redshift_host: new_resource.redshift_host,
      mysql_host_id: new_resource.mysql_host_id,
      mysql_host: new_resource.mysql_host,
      mysql_username: new_resource.mysql_username,
      mysql_password: new_resource.mysql_password,
      ec2_instance_type: new_resource.ec2_instance_type,
      ec2_ami: new_resource.ec2_ami,
      ec2_security_group_id: new_resource.ec2_security_group_id,
      ec2_subnet_id: new_resource.ec2_subnet_id,
      s3_etl_bucket: new_resource.s3_etl_bucket,
      etl_role: new_resource.etl_role,
      resource_role: new_resource.resource_role,
      s3_base_path: new_resource.s3_base_path,
      config_sync_from_s3: new_resource.config_sync_from_s3,
      sns_topic_arn_failure: new_resource.sns_topic_arn_failure,
      sns_topic_arn_warning: new_resource.sns_topic_arn_warning
    )
    cookbook new_resource.cookbook
  end
end

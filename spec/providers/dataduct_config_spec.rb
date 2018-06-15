require_relative '../spec_helper'

describe 'dataduct-test::config' do
  cached(:subject) do
    ChefSpec::SoloRunner.new(step_into: %w(dataduct_config)).converge(described_recipe)
  end

  it 'creates config with specified values' do
    expected_config = <<EOM
# Chef generated dataduct.cfg

bootstrap:
  ec2:
    - step_type: transform
      command: dataduct config sync_from_s3 ~/.dataduct/dataduct.cfg
      no_output: true

ec2:
    INSTANCE_TYPE: m3.xlarge
    ETL_AMI: ami-4d089d5a # ami-cb1693dc
    SECURITY_GROUP_ID: sg-ojete
    SUBNET_ID: subnet-calor

emr:
    MASTER_INSTANCE_TYPE: m3.2xlarge
    NUM_CORE_INSTANCES: 1
    CORE_INSTANCE_TYPE: m3.large
    CLUSTER_AMI: 3.1.0

etl:
    S3_ETL_BUCKET: bucket-molon
    ROLE: DataPipelineRole
    RESOURCE_ROLE: datapipe
    S3_BASE_PATH: staging
    SNS_TOPIC_ARN_FAILURE: arn:aws:sns:us-west-1:123456789012:my_failure_topic
    SNS_TOPIC_ARN_WARNING: arn:aws:sns:us-west-1:123456789012:my_warning_topic

mysql:
    mysql_host_identifier:
        HOST: almendra
        PASSWORD: secure_password
        USERNAME: mysql_user

redshift:
    CLUSTER_ID: funny_cluster_name
    DATABASE_NAME: funny_database_name
    HOST: redshift_hostname
    PASSWORD: supersecureredshiftpassword
    USERNAME: redshiftuser
    PORT: 5439

production:
    etl:
    S3_BASE_PATH: staging

logging:
    CONSOLE_DEBUG_LEVEL: INFO
    FILE_DEBUG_LEVEL: DEBUG
    LOG_DIR: ~/.dataduct
    LOG_FILE: dataduct.log
EOM

    is_expected.to render_file('/etc/dataduct.cfg').with_content(expected_config)
  end
end

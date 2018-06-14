describe file('/etc/dataduct.cfg') do
  it { is_expected.to exist }
end

describe file('/etc/dataduct.cfg') do
  its('content') { should include('SNS_TOPIC_ARN_FAILURE: arn:aws:sns:us-west-1:123456789012:my_failure_topic') }
end

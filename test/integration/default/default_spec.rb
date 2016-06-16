describe command('dataduct') do
  it { should exist }
end

describe command('dataduct') do
  its('stderr') { should match('usage: dataduct') }
end

name             'dataduct'
maintainer       'Flywire Corp.'
maintainer_email 'engineering@flywire.com'
license          'MIT'
description      'Installs/Configures dataduct'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

issues_url 'https://github.com/peertransfer/dataduct-cookbook/issues'
source_url 'https://github.com/peertransfer/dataduct-cookbook'

depends 'build-essential'
depends 'poise-python', '~> 1.4'

chef_version '>= 12.15'
supports 'debian'

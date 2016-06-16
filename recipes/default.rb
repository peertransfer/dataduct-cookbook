#
# Cookbook Name:: dataduct
# Recipe:: default
#
# Copyright 2016, Flywire Corp.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'build-essential'

package 'libmysqlclient-dev'
package 'libpq-dev'

python_runtime '2'

python_package 'dataduct'
python_package 'requests'

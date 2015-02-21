#
# Cookbook Name:: discourse
# Recipe:: default
#
# Copyright (C) 2015 Roger Lipscombe
#
# All rights reserved - Do Not Redistribute
#

include_recipe "users"

user 'discourse' do
    home '/var/discourse'
    system true
    action :create
end

directory '/var/discourse' do
    owner 'discourse'
    group 'discourse'
    mode '0755'
    action :create
end

git '/var/discourse' do
    repository 'git://github.com/discourse/discourse_docker.git'
    checkout_branch 'master'
    group 'discourse'
    user 'discourse'
    action :sync
end

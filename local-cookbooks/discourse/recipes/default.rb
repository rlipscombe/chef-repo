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

template '/var/discourse/containers/app.yml' do
    source 'app.yml.erb'
    variables({
        :discourse_developer_emails => node[:discourse][:developer_emails],
        :discourse_hostname => node[:discourse][:hostname],
        :discourse_smtp_address => node[:discourse][:smtp_address],
        :discourse_smtp_port => node[:discourse][:smtp_port],
        :discourse_smtp_user_name => node[:discourse][:smtp_user_name],
        :discourse_smtp_password => node[:discourse][:smtp_password]
    })
end

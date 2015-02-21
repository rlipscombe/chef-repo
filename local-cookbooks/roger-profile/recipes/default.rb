#
# Cookbook Name:: roger-profile
# Recipe:: default
#
# Copyright (C) 2014 Roger Lipscombe
#
# All rights reserved - Do Not Redistribute
#

git '/home/roger/bash_profile' do
    repository 'git://github.com/rlipscombe/bash_profile'
    checkout_branch 'master'
    action :sync
    group 'roger'
    user 'roger'
end

execute 'roger-profile' do
    command 'bash_profile/mk'
    creates '/home/roger/.bash_prompt'
    action :run
    group 'roger'
    user 'roger'
    cwd '/home/roger'
    environment ({'HOME' => '/home/roger'})
end

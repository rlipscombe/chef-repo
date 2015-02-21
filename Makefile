all: roles cookbooks data_bags

.PHONY: roles cookbooks data_bags

roles:
	knife role from file roles/base.rb
	knife role from file roles/discourse.rb

cookbooks:
	berks install
	berks vendor cookbooks
	knife cookbook upload -a

data_bags:
	knife data bag from file users data_bags/users

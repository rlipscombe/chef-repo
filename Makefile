all: roles cookbooks data_bags

.PHONY: roles data_bags

roles:
	knife role from file roles/base.rb

cookbooks:
	berks install
	berks vendor cookbooks
	knife cookbook upload -a

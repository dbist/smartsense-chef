This cookbook installs and configures Hortonworks SmartSense standalone.

TODO
====

2. test for listening port, replace with attribute
3. Separate cookbook for hst and hst agent 
5. Do I need a gateway?
6. Need SSL certificate
7. Replace hard-coded smartsense*.deb file with URL of the local repo, good for now as it does not require internet connection but for deployment, need to replace with remote_file
10. make sure requirements are met by SmartSense package and not included in chef recipe.
11. Although ServerSpec is more important than ChefSpec, the following resources are not covered by current ChefSpec coverage report
  
  1. template[/etc/hst/conf/hst-server.ini]
  2. smartsense-chef/recipes/smartsense_setup.rb:14
  3. cookbook_file[/tmp/smartsense-hst_1.2.1-161_amd64.deb]
  4. smartsense-chef/recipes/default.rb:10
  5. apt_package[wget]
  6. smartsense-chef/recipes/default.rb:22
  7. apt_package[sysstat]               
  8. smartsense-chef/recipes/default.rb:22
  9. apt_package[dstat]                 
  10. smartsense-chef/recipes/default.rb:22
  11. apt_package[lsof]                  
  12. smartsense-chef/recipes/default.rb:22
  13. apt_package[net-tools]             
  14. smartsense-chef/recipes/default.rb:22
  15. apt_package[python2.7]
  16. smartsense-chef/recipes/default.rb:22

Requirements
============

Please see [latest documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Depends on https://github.com/agileorbit-cookbooks/java.git

Since smartsense-hst package is provided by Hortonworks via support portal, download the file manually and place in files directory and/or replace with remote file in the recipe and upload the package to local repo

Usage
=====

Add `smartsense-chef` to your node's `run_list`.

Testing
=======

A `.kitchen.yaml` file is provided. 

1. Run `kitchen converge` to verify this cookbook.
2. Run `foodcritic` for lint tests
3. Run `kitchen verify` for ServerSpec tests
4. Run `rspec --color` for ChefSpec tests

This cookbook installs and configures Hortonworks SmartSense standalone version 1.2.2.

TODO
====

2. test for listening port, replace with attribute
3. Separate cookbook for hst and hst agent 
5. Do I need a gateway?
6. Need SSL certificate
10. make sure requirements are met by SmartSense package and not included in chef recipe.
11. Although ServerSpec is more important than ChefSpec, the following resources are not covered by current ChefSpec coverage report
  
  3. cookbook_file[/tmp/smartsense-hst_1.2.1-161_amd64.deb]

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

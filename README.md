This cookbook installs and configures Hortonworks SmartSense standalone.

TODO
====

1. Still requires to manually start hst server
2. test for listening port, replace with attribute
3. Separate cookbook for hst and hst agent 
5. Do I need a gateway?
6. Need SSL certificate
7. Replace hard-coded smartsense*.deb file with URL of the local repo, good for now as it does not require internet connection but for deployment, need to replace with remote_file
10. make sure requirements are met by SmartSense package and not included in chef recipe.
11. ChefSpec fails with expected "dpkg_package[smartsense-hst]" with action :install to be in Chef run. Other dpkg_package resources

Requirements
============

Please see [latest documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Depends on https://github.com/agileorbit-cookbooks/java.git

Since smartsense-hst package is provided by Hortonworks via support portal, download the file manually and place in files directory and/or replace with remote file in the recipe and upload the package to local repo

Usage
=====

Add `smartsense` to your node's `run_list`.

Testing
=======

A `.kitchen.yaml` file is provided. 

Run `kitchen converge` to verify this cookbook.
Run `foodcritic` for lint tests
Run `kitchen verify` for ServerSpec tests
Run `rspec --color` for ChefSpec tests

This cookbook installs and configures Hortonworks SmartSense standalone version 1.2.2. Additionally, you can deploy SmartSense Gateway for easy bundle upload.

TODO
====

1. add apt-key adv keyserver following http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.2.0/bk_Installing_HDP_AMB/content/_download_the_ambari_repo_ubuntu12.html
2. test for listening port, replace with attribute
3. Separate cookbook for hst and hst agent 
4. rspec returns the below, how to handle cached files? 
	rspec ./spec/default_spec.rb:57 # smartsense-chef::smartsense_setup smartsense-hst file exists
6. Need SSL certificate
8. make sure requirements are met by SmartSense package and not included in chef recipe.
9. rspec --color complains about hst remote file if missing if it's pointing to file cache vs. hard path to /tmp/smartsense-hst
12. if local repo then it's not dpkg but package, use condition
```
package "smartsense-hst" do
   action :install
   version '1.2.2-0_amd64'
end
```
13. BUG: hst status should return non-zero if status is off
14. serverspec test should check whether hst process is running (notify smartsense bash action, smartsense is not running then do nothing)
15. removing depends 'java' breaks after making changes

Requirements
============

Please see [latest documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Dependencies
============

https://github.com/agileorbit-cookbooks/java.git
https://github.com/chef-cookbooks/apt

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

Technical Support
=================

This cookbook is provided without any warranties. Use at your own risk. To file a bug report, please respond on [this thread](https://community.hortonworks.com/content/repo/38515/smartsense-chef-cookbook-for-non-ambari-install.html).

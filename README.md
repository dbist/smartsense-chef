This cookbook installs and configures Hortonworks SmartSense standalone.

TODO
====

1. Need to automate JDK install similar to chef-bach
2. Need to create attribute list for hst setup and hst setup-agent
3. How do I handle multiple machines?
4. How do I choose which machine is hst server?
5. Do I need gateway?
6. Need SSL certificate
7. Replace hard-coded smartsense*.deb file with URL of the local repo

Requirements
============

Please see [latested documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Usage
=====

Add `smartsense` to your node's `run_list`.

Testing
=======

A `.kitchen.yaml` file is provided. Run `kitchen converge` to verify this cookbook.

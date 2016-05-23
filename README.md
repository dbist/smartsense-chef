This cookbook installs and configures Hortonworks SmartSense standalone.

TODO
====

1. Need to automate JDK install similar to chef-bach, do it with Oracle JDK
2. Figure out whether Chef has a way to run CLI commands with multiple arguments and/or run Chef's bash script and pass argument list to SED hst-server.ini. Only changes on HST server will take effect, also needs HST restart.
3. How do I handle multiple machines? Chef Nodes 
4. How do I choose which machine is hst server? Chef Roles
5. Do I need a gateway?
6. Need SSL certificate
7. Replace hard-coded smartsense*.deb file with URL of the local repo, good for now as it does not require internet connection but for deployment, need to replace with remote_file
8. Make recipes indempotant!
9. Convert Account, SmartSense ID and email address to encrypted data bag?

Requirements
============

Please see [latested documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Usage
=====

Add `smartsense` to your node's `run_list`.

Testing
=======

A `.kitchen.yaml` file is provided. Run `kitchen converge` to verify this cookbook.

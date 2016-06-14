default['smartsense-chef']['account'] = 'Hortonworks, Inc.'
default['smartsense-chef']['id'] = 'A-00000000-C-00000000'
default['smartsense-chef']['email'] = 'dummyaccount@dummy.com'
default['smartsense-chef']['directory'] = '/var/lib/smartsense/hst-server/data'
default['smartsense-chef']['port'] = '9000'
default['smartsense-chef']['certificate'] = 'n'
default['smartsense-chef']['java_home'] = '/usr/lib/jvm/java-8-oracle-amd64'
default['smartsense-chef']['cluster_name'] = 'samplecluster'
default['smartsense-chef']['secured'] = 'n'
default['smartsense-chef']['deploy_to'] = '/etc/hst/conf/'
default['smartsense-chef']['smartsense_version'] = '1.2.2-0_amd64'
default['smartsense-chef']['use_local_repo'] = 'false'
default['smartsense-chef']['repo_url'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.2.0/pool/main/s/smartsense-hst/'

# Override defaults for the Java cookbook
default['java']['jdk_version'] = 8
default['java']['install_flavor'] = "oracle"
default['java']['accept_license_agreement'] = true
default['java']['oracle']['jce']['enabled'] = true
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['set_default'] = true


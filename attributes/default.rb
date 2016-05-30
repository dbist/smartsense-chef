default['smartsense-chef']['account'] = 'Hortonworks, Inc.'
default['smartsense-chef']['id'] = 'A-00000000-C-00000000'
default['smartsense-chef']['email'] = 'dummyaccount@dummy.com'
default['smartsense-chef']['directory'] = '/var/lib/smartsense/hst-server/data'
default['smartsense-chef']['port'] = '9000'
default['smartsense-chef']['certificate'] = 'n'
default['smartsense-chef']['java_home'] = '/usr/lib/jvm/java-7-openjdk-amd64'
default['smartsense-chef']['cluster_name'] = 'samplecluster'
default['smartsense-chef']['secured'] = 'n'

# http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz
# Override defaults for the Java cookbook
default['java']['jdk_version'] = 8
default['java']['install_flavor'] = "oracle"
default['java']['accept_license_agreement'] = true
default['java']['oracle']['jce']['enabled'] = true
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['set_default'] = true

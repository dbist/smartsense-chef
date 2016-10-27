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

# gateway specific properties
default['smartsense-chef']['gateway_enabled'] = true
default['smartsense-chef']['gateway_host'] = 'default-ubuntu-1404'
default['smartsense-chef']['gateway_port'] = '9451'
default['smartsense-chef']['gateway_sftp_username'] = 'changeme'
default['smartsense-chef']['gateway_sftp_password'] = 'changeme'
default['smartsense-chef']['gateway_sftp_host'] = 'smartsense.hortonworks.com'
default['smartsense-chef']['gateway_sftp_port'] = '2222'

# agent specific properties
default['smartsense-chef']['hst_server'] = 'default-ubuntu-1404'

# Ambari repo specific properties, checksum is SHA-256 checksum of a file, i.e. `sha256sum smartsense-hst_1.2.2-0_amd64.deb`
default['smartsense-chef']['checksum'] = '2b4a2fcc6e74a8a763eb43e3ec257a5e4e667956baf0f1aa1fcb2111539d7d68'
default['smartsense-chef']['ambari_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.2.0'
default['smartsense-chef']['use_local_repo'] = false

# APT repository attributes
default['apt']['compile_time_update'] = true


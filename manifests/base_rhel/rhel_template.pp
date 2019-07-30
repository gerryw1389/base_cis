# Default RHEL Template

class base_cis::base_rhel::rhel_template {
  include ::base_cis::base_rhel::rhel_cis
  class {'::secure_linux_cis':}

  file { '/tmp/base_cis_scripts':
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
  }
  file { '/tmp/base_cis_scripts/fix_setup.sh':
    ensure  => present,
    source  => 'puppet:///modules/base_cis/linux/scripts/fix_setup.sh',
    require => File['/tmp/base_cis_scripts'],
  }
  file { '/tmp/base_cis_scripts/test_setup.sh':
    ensure  => present,
    source  => 'puppet:///modules/base_cis/linux/scripts/test_setup.sh',
    require => File['/tmp/base_cis_scripts'],
  }

  # exec { 'run_onetime_setup_script':
  # command  => file('base_cis/linux/scripts/fix_setup.sh'),
  # unless   => file('base_cis/linux/scripts/test_setup.sh'),
  # provider => shell,
  # }
}

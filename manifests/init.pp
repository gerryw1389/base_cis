# Apply default template based on OS version

class base_cis {
  case $facts['os']['name'] {
      'windows': {
      include base_cis::base_windows
      }
      'RedHat': {
      include base_cis::base_rhel
      }
      'CentOS': {
      include base_cis::base_centos
    }
    default: {
      fail("Unsupported operating system detected: ${::facts['operatingsystem']}")
    }
  }
}

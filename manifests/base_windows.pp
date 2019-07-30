# Apply default Windows template based on OS version

class base_cis::base_windows {
  case $facts['os']['release']['full'] {
    '2012 R2': {
    include base_cis::base_windows::twentytwelve_template
    }
    '2016': {
    include base_cis::base_windows::twentysixteen_template
    }
    default: {
    fail("Unsupported operating system detected: ${$::facts['os']['release']['full']}")
    }
  }
}

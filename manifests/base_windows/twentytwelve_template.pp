# Apply default 2012 template

class base_cis::base_windows::twentytwelve_template {
  if $facts['hostname'] =~ /^.*dc$/ {
    file { 'C:/scripts':
    ensure => directory,
    }
    file { 'C:/ProgramData/PuppetLabs/scripts':
    ensure => directory,
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet':
    ensure  => directory,
    require => File['C:/ProgramData/PuppetLabs/scripts'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates':
    ensure  => directory,
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/EMET.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/EMET.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/PtH.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/PtH.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012dc.csv':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012dc.csv',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012dc.inf':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012dc.inf',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/emet.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/emet.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/laps.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/laps.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/LGPO.exe':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/LGPO.exe',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012dc-hash.txt':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012dc-hash.txt',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    exec { 'create_reg_paths':
    command   => file('base_cis/2012/fix_2012dc_force_create_regpaths.ps1'),
    unless    => file('base_cis/2012/test_2012dc_force_create_regpaths.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_emet':
    command   => file('base_cis/fix_install_emet.ps1'),
    unless    => file('base_cis/test_install_emet.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_laps':
    command   => file('base_cis/fix_install_laps.ps1'),
    unless    => file('base_cis/test_install_laps.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012dc_audit':
    command   => file('base_cis/lgpo/2012dc_fix_audit.ps1'),
    unless    => file('base_cis/lgpo/2012dc_test_audit.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012dc_cse':
    command   => file('base_cis/lgpo/2012dc_fix_cse.ps1'),
    unless    => file('base_cis/lgpo/2012dc_test_cse.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012dc_security_policy':
    command   => file('base_cis/lgpo/2012dc_fix_security_policy.ps1'),
    unless    => file('base_cis/lgpo/2012dc_test_security_policy.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    include ::base_cis::base_windows::twentytwelve_dc_registry
  }
  else {
    file { 'C:/scripts':
    ensure => directory,
    }
    file { 'C:/ProgramData/PuppetLabs/scripts':
    ensure => directory,
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet':
    ensure  => directory,
    require => File['C:/ProgramData/PuppetLabs/scripts'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates':
    ensure  => directory,
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/EMET.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/EMET.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/EMET.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/EMET.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/PtH.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/PtH.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/templates/PtH.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/PtH.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012client.csv':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012client.csv',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012client.inf':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012client.inf',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/emet.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/emet.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/laps.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/laps.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/LGPO.exe':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/LGPO.exe',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2012client-hash.txt':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2012/2012client-hash.txt',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    exec { 'create_reg_paths':
    command   => file('base_cis/2012/fix_2012client_force_create_regpaths.ps1'),
    unless    => file('base_cis/2012/test_2012client_force_create_regpaths.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_emet':
    command   => file('base_cis/fix_install_emet.ps1'),
    unless    => file('base_cis/test_install_emet.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_laps':
    command   => file('base_cis/fix_install_laps.ps1'),
    unless    => file('base_cis/test_install_laps.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012client_audit':
    command   => file('base_cis/lgpo/2012client_fix_audit.ps1'),
    unless    => file('base_cis/lgpo/2012client_test_audit.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012client_cse':
    command   => file('base_cis/lgpo/2012client_fix_cse.ps1'),
    unless    => file('base_cis/lgpo/2012client_test_cse.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2012client_security_policy':
    command   => file('base_cis/lgpo/2012client_fix_security_policy.ps1'),
    unless    => file('base_cis/lgpo/2012client_test_security_policy.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    include ::base_cis::base_windows::twentytwelve_client_registry
  }
}

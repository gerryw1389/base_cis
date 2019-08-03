# Apply default 2016 template

class base_cis::base_windows::twentysixteen_template {
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
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/AdmPwd.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/AdmPwd.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/MSS-legacy.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/MSS-legacy.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/SecGuide.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/SecGuide.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016dc.csv':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016dc.csv',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016dc.inf':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016dc.inf',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/laps.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/laps.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/LGPO.exe':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/LGPO.exe',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016dc-hash.txt':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016dc-hash.txt',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    exec { 'create_reg_paths':
    command   => file('base_cis/2016/fix_2016dc_force_create_regpaths.ps1'),
    unless    => file('base_cis/2016/test_2016dc_force_create_regpaths.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_laps':
    command   => file('base_cis/fix_install_laps.ps1'),
    unless    => file('base_cis/test_install_laps.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016dc_audit':
    command   => file('base_cis/lgpo/2016dc_fix_audit.ps1'),
    unless    => file('base_cis/lgpo/2016dc_test_audit.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016dc_cse':
    command   => file('base_cis/lgpo/2016dc_fix_cse.ps1'),
    unless    => file('base_cis/lgpo/2016dc_test_cse.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016dc_security_policy':
    command   => file('base_cis/lgpo/2016dc_fix_security_policy.ps1'),
    unless    => file('base_cis/lgpo/2016dc_test_security_policy.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    include ::base_cis::base_windows::twentysixteen_dc_registry
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
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/AdmPwd.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/AdmPwd.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/AdmPwd.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/AdmPwd.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/MSS-legacy.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/MSS-legacy.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/MSS-legacy.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/MSS-legacy.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/en-US/SecGuide.adml':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.adml',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.adml'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates'],
    }
    file { 'C:/Windows/PolicyDefinitions/SecGuide.admx':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/templates/SecGuide.admx',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet/templates/SecGuide.admx'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016client.csv':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016client.csv',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016client.inf':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016client.inf',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/laps.msi':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/laps.msi',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/LGPO.exe':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/LGPO.exe',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    file { 'C:/ProgramData/PuppetLabs/scripts/puppet/2016client-hash.txt':
    ensure  => file,
    source  => 'puppet:///modules/base_cis/2016/2016client-hash.txt',
    require => File['C:/ProgramData/PuppetLabs/scripts/puppet'],
    }
    exec { 'create_reg_paths':
    command   => file('base_cis/2016/fix_2016client_force_create_regpaths.ps1'),
    unless    => file('base_cis/2016/test_2016client_force_create_regpaths.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'install_laps':
    command   => file('base_cis/fix_install_laps.ps1'),
    unless    => file('base_cis/test_install_laps.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016client_audit':
    command   => file('base_cis/lgpo/2016client_fix_audit.ps1'),
    unless    => file('base_cis/lgpo/2016client_test_audit.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016client_cse':
    command   => file('base_cis/lgpo/2016client_fix_cse.ps1'),
    unless    => file('base_cis/lgpo/2016client_test_cse.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    exec { 'lgpo_2016client_security_policy':
    command   => file('base_cis/lgpo/2016client_fix_security_policy.ps1'),
    unless    => file('base_cis/lgpo/2016client_test_security_policy.ps1'),
    provider  => powershell,
    logoutput => true,
    }
    include ::base_cis::base_windows::twentysixteen_client_registry
  }
}

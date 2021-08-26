# 2012 client registry settings

class base_cis::base_windows::twentytwelve_client_registry {
# Begin secedit import
# Handled by secedit import:
# rule_1.1.1_L1_Ensure_Enforce_password_history_is_set_to_24_or_more_passwords
# rule_1.1.2_L1_Ensure_Maximum_password_age_is_set_to_60_or_fewer_days_but_not_0
# rule_1.1.3_L1_Ensure_Minimum_password_age_is_set_to_1_or_more_days
# rule_1.1.4_L1_Ensure_Minimum_password_length_is_set_to_14_or_more_characters
# rule_1.1.5_L1_Ensure_Password_must_meet_complexity_requirements_is_set_to_Enabled
# rule_1.1.6_L1_Ensure_Store_passwords_using_reversible_encryption_is_set_to_Disabled
# rule_1.2.1_L1_Ensure_Account_lockout_duration_is_set_to_15_or_more_minutes
# rule_1.2.2_L1_Ensure_Account_lockout_threshold_is_set_to_10_or_fewer_invalid_logon_attempts_but_not_0
# rule_1.2.3_L1_Ensure_Reset_account_lockout_counter_after_is_set_to_15_or_more_minutes
# rule_2.2.1_L1_Ensure_Access_Credential_Manager_as_a_trusted_caller_is_set_to_No_One
# rule_2.2.2_L1_Configure_Access_this_computer_from_the_network
# rule_2.2.3_L1_Ensure_Act_as_part_of_the_operating_system_is_set_to_No_One
# rule_2.2.5_L1_Ensure_Adjust_memory_quotas_for_a_process_is_set_to_Administrators_LOCAL_SERVICE_NETWORK_SERVICE
# rule_2.2.6_L1_Ensure_Allow_log_on_locally_is_set_to_Administrators
# rule_2.2.7_L1_Configure_Allow_log_on_through_Remote_Desktop_Services
# rule_2.2.8_L1_Ensure_Back_up_files_and_directories_is_set_to_Administrators
# rule_2.2.9_L1_Ensure_Change_the_system_time_is_set_to_Administrators_LOCAL_SERVICE
# rule_2.2.10_L1_Ensure_Change_the_time_zone_is_set_to_Administrators_LOCAL_SERVICE
# rule_2.2.11_L1_Ensure_Create_a_pagefile_is_set_to_Administrators
# rule_2.2.12_L1_Ensure_Create_a_token_object_is_set_to_No_One
# rule_2.2.13_L1_Ensure_Create_global_objects_is_set_to_Administrators_LOCAL_SERVICE_NETWORK_SERVICE_SERVICE
# rule_2.2.14_L1_Ensure_Create_permanent_shared_objects_is_set_to_No_One
# rule_2.2.15_L1_Configure_Create_symbolic_links
# rule_2.2.16_L1_Ensure_Debug_programs_is_set_to_Administrators
# rule_2.2.17_L1_Configure_Deny_access_to_this_computer_from_the_network
# rule_2.2.18_L1_Ensure_Deny_log_on_as_a_batch_job_to_include_Guests
# rule_2.2.19_L1_Ensure_Deny_log_on_as_a_service_to_include_Guests
# rule_2.2.20_L1_Ensure_Deny_log_on_locally_to_include_Guests
# rule_2.2.21_L1_Configure_Deny_log_on_through_Remote_Desktop_Services
# rule_2.2.22_L1_Configure_Enable_computer_and_user_accounts_to_be_trusted_for_delegation
# rule_2.2.23_L1_Ensure_Force_shutdown_from_a_remote_system_is_set_to_Administrators
# rule_2.2.24_L1_Ensure_Generate_security_audits_is_set_to_LOCAL_SERVICE_NETWORK_SERVICE
# rule_2.2.25_L1_Configure_Impersonate_a_client_after_authentication
# rule_2.2.26_L1_Ensure_Increase_scheduling_priority_is_set_to_Administrators
# rule_2.2.27_L1_Ensure_Load_and_unload_device_drivers_is_set_to_Administrators
# rule_2.2.28_L1_Ensure_Lock_pages_in_memory_is_set_to_No_One
# rule_2.2.30_L1_Configure_Manage_auditing_and_security_log
# rule_2.2.31_L1_Ensure_Modify_an_object_label_is_set_to_No_One
# rule_2.2.32_L1_Ensure_Modify_firmware_environment_values_is_set_to_Administrators
# rule_2.2.33_L1_Ensure_Perform_volume_maintenance_tasks_is_set_to_Administrators
# rule_2.2.34_L1_Ensure_Profile_single_process_is_set_to_Administrators
# rule_2.2.35_L1_Ensure_Profile_system_performance_is_set_to_Administrators_NT_SERVICEWdiServiceHost
# rule_2.2.36_L1_Ensure_Replace_a_process_level_token_is_set_to_LOCAL_SERVICE_NETWORK_SERVICE
# rule_2.2.37_L1_Ensure_Restore_files_and_directories_is_set_to_Administrators
# rule_2.2.38_L1_Ensure_Shut_down_the_system_is_set_to_Administrators
# rule_2.2.40_L1_Ensure_Take_ownership_of_files_or_other_objects_is_set_to_Administrators
# rule_2.3.1.1_L1_Ensure_Accounts_Administrator_account_status_is_set_to_Disabled_MS_only
# End Secedit import
######################################
# The Recovery Console option is set to permit automatic logon to the system.
registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel':
  ensure => present,
  type   => dword,
  data   => 0,
}
# The Recovery Console SET command must be disabled.
registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SetCommand':
  ensure => present,
  type   => dword,
  data   => 0,
}
# Users are not warned in advance that their passwords will expire.
registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning':
  ensure => present,
  type   => dword,
  data   => 14,
}
# The machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.
# Supposed to be 900 but this made sign in require a smart card
registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\ScForceOption':
  ensure => present,
  type   => dword,
  data   => 0,
}
# A system must be logged on to before removing from a docking station.
registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\UndockWithoutLogon':
  ensure => present,
  type   => dword,
  data   => 0,
}
# Allow third-party browser extensions are not disabled.
registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\ValidateAdminCodeSignatures':
  ensure => present,
  type   => dword,
  data   => 0,
}
# Software certificate restriction policies must be enforced.
# May break some things! Change to 0 to disable
registry_value { 'HKLM\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\AuthenticodeEnabled':
  ensure => present,
  type   => dword,
  data   => 1,
}
# Auditing the Access of Global System Objects must be turned off.
registry_value { 'HKLM\System\CurrentControlSet\Control\Lsa\AuditBaseObjects':
  ensure => present,
  type   => dword,
  data   => 0,
}
# The system must be configured to prevent the storage of passwords and credentials.
# May break some things! Change to 0 to disable
registry_value { 'HKLM\System\CurrentControlSet\Control\Lsa\DisableDomainCreds':
  ensure => present,
  type   => dword,
  data   => 1,
}
# The system must be configured to use FIPS-compliant algorithms for encryption, hashing, and signing.
# May break some things! Change to 0 to disable
registry_value { 'HKLM\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\Enabled':
  ensure => present,
  type   => dword,
  data   => 1,
}
# Unknown
registry_value { 'HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown':
  ensure => present,
  type   => dword,
  data   => 1,
}
# Caching of logon credentials must be limited.
registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount':
  ensure => present,
  type   => string,
  data   => '10',
}
# Optional Subsystems are permitted to operate on the system.
# May break some things! Delete this entry to resolve.
$subsystems_array = []
registry_value { 'HKLM:\System\CurrentControlSet\Control\Session Manager\SubSystems\optional':
  ensure => present,
  type   => array,
  data   => $subsystems_array,
}
######################################

# Disabling temporarily so we can use built-in Administrator to do Admin functions
# rule_2.3.1.1_L1_Ensure_Accounts_Administrator_account_status_is_set_to_Disabled_MS_only
# exec { 'rule_2.3.1.5_L1_Configure_Accounts_Rename_administrator_account':
#   command   => file('base_cis/fix_rule_2.3.1.1_l1_ensure_accounts_administrator_account_status_is_set_to_disabled_ms_only.ps1'),
#   unless    => file('base_cis/test_rule_2.3.1.1_l1_ensure_accounts_administrator_account_status_is_set_to_disabled_ms_only.ps1'),
#   provider  => powershell,
#   logoutput => true,
# }

# rule_2.3.1.2_L1_Ensure_Accounts_Block_Microsoft_accounts_is_set_to_Users_cant_add_or_log_on_with_Microsoft_accounts
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser':
  ensure => present,
  type   => dword,
  data   => 3,
}

# rule_2.3.1.3_L1_Ensure_Accounts_Guest_account_status_is_set_to_Disabled_MS_only
exec { 'rule_2.3.1.5_L1_Ensure_Accounts_Guest_account_status_is_set_to_Disabled_MS_only':
  command   => file('base_cis/fix_rule_2.3.1.3_l1_ensure_accounts_guest_account_status_is_set_to_disabled_ms_only.ps1'),
  unless    => file('base_cis/test_rule_2.3.1.3_l1_ensure_accounts_guest_account_status_is_set_to_disabled_ms_only.ps1'),
  provider  => powershell,
  logoutput => true,
}


# rule_2.3.1.4_L1_Ensure_Accounts_Limit_local_account_use_of_blank_passwords_to_console_logon_only_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse':
  ensure => present,
  type   => dword,
  data   => 1,
}

# This happens with secedit import
# rule_2.3.1.5_L1_Configure_Accounts_Rename_administrator_account
# exec { 'rule_2.3.1.5_L1_Configure_Accounts_Rename_administrator_account':
#   command   => file('base_cis/fix_rule_2.3.1.5_l1_configure_accounts_rename_administrator_account.ps1'),
#   unless    => file('base_cis/test_rule_2.3.1.5_l1_configure_accounts_rename_administrator_account.ps1'),
#   provider  => powershell,
#   logoutput => true,
# }

# This happens with secedit import
# rule_2.3.1.6_L1_Configure_Accounts_Rename_guest_account
# exec { 'rule_2.3.1.6_L1_Configure_Accounts_Rename_guest_account':
#   command   => file('base_cis/fix_rule_2.3.1.6_l1_configure_accounts_rename_guest_account.ps1'),
#   unless    => file('base_cis/test_rule_2.3.1.6_l1_configure_accounts_rename_guest_account.ps1'),
#  provider  => powershell,
#   logoutput => true,
# }

# rule_2.3.2.1_L1_Ensure_Audit_Force_audit_policy_subcategory_settings_Windows_Vista_or_later_to_override_audit_policy_category_settings_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.2.2_L1_Ensure_Audit_Shut_down_system_immediately_if_unable_to_log_security_audits_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\CrashOnAuditFail':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.4.1_L1_Ensure_Devices_Allowed_to_format_and_eject_removable_media_is_set_to_Administrators
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_2.3.4.2_L1_Ensure_Devices_Prevent_users_from_installing_printer_drivers_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\AddPrinterDrivers':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.6.1_L1_Ensure_Domain_member_Digitally_encrypt_or_sign_secure_channel_data_always_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.6.2_L1_Ensure_Domain_member_Digitally_encrypt_secure_channel_data_when_possible_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.6.3_L1_Ensure_Domain_member_Digitally_sign_secure_channel_data_when_possible_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.6.4_L1_Ensure_Domain_member_Disable_machine_account_password_changes_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.6.5_L1_Ensure_Domain_member_Maximum_machine_account_password_age_is_set_to_30_or_fewer_days_but_not_0


# rule_2.3.6.6_L1_Ensure_Domain_member_Require_strong_Windows_2000_or_later_session_key_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.7.1_L1_Ensure_Interactive_logon_Do_not_display_last_user_name_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.7.2_L1_Ensure_Interactive_logon_Do_not_require_CTRLALTDEL_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.7.3_L1_Ensure_Interactive_logon_Machine_inactivity_limit_is_set_to_900_or_fewer_seconds_but_not_0
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\InactivityTimeoutSecs':
  ensure => present,
  type   => dword,
  data   => 900,
}

# rule_2.3.7.4_L1_Configure_Interactive_logon_Message_text_for_users_attempting_to_log_on
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticecaption':
  ensure => present,
  type   => string,
  data   => 'Company Notice',
}

# rule_2.3.7.5_L1_Configure_Interactive_logon_Message_title_for_users_attempting_to_log_on
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\legalnoticetext':
  ensure => present,
  type   => string,
  data   => 'Unauthorized users are prohibited',
}

# rule_2.3.7.7_L1_Ensure_Interactive_logon_Prompt_user_to_change_password_before_expiration_is_set_to_between_5_and_14_days

# rule_2.3.7.8_L1_Ensure_Interactive_logon_Require_Domain_Controller_Authentication_to_unlock_workstation_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ForceUnlockLogon':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.7.9_L1_Ensure_Interactive_logon_Smart_card_removal_behavior_is_set_to_Lock_Workstation_or_higher
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SCRemoveOption':
  ensure => present,
  type   => string,
  data   => '1',
}

# rule_2.3.8.1_L1_Ensure_Microsoft_network_client_Digitally_sign_communications_always_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature':
  ensure => present,
  type   => dword,
  data   => 1,
}
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.8.2_L1_Ensure_Microsoft_network_client_Digitally_sign_communications_if_server_agrees_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature':
  ensure => present,
  type   => dword,
  data   => 1,
}
# rule_2.3.8.3_L1_Ensure_Microsoft_network_client_Send_unencrypted_password_to_third-party_SMB_servers_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnablePlainTextPassword':
  ensure => present,
  type   => dword,
  data   => 0,
}
# rule_2.3.9.1_L1_Ensure_Microsoft_network_server_Amount_of_idle_time_required_before_suspending_session_is_set_to_15_or_fewer_minutes_but_not_0

# rule_2.3.9.2_L1_Ensure_Microsoft_network_server_Digitally_sign_communications_always_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\AutoDisconnect':
  ensure => present,
  type   => dword,
  data   => 15,
}
# rule_2.3.9.3_L1_Ensure_Microsoft_network_server_Digitally_sign_communications_if_client_agrees_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnableSecuritySignature':
  ensure => present,
  type   => dword,
  data   => 1,
}
# rule_2.3.9.4_L1_Ensure_Microsoft_network_server_Disconnect_clients_when_logon_hours_expire_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\enableforcedlogoff':
  ensure => present,
  type   => dword,
  data   => 1,
}
# rule_2.3.9.5_L1_Ensure_Microsoft_network_server_Server_SPN_target_name_validation_level_is_set_to_Accept_if_provided_by_client_or_higher_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\SMBServerNameHardeningLevel':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.10.1_L1_Do_not_allow_anonymous_enumeration_of_SAM_accounts_is_set_to_Disabled


# rule_2.3.10.2_L1_Ensure_Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.10.3_L1_Ensure_Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts_and_shares_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.10.5_L1_Ensure_Network_access_Let_Everyone_permissions_apply_to_anonymous_users_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.10.6_L1_Configure_Network_access_Named_Pipes_that_can_be_accessed_anonymously
$nullsessionpipes_array = []
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes':
  ensure => present,
  type   => array,
  data   => $nullsessionpipes_array,
}

# rule_2.3.10.7_L1_Configure_Network_access_Remotely_accessible_registry_paths
$machine_array = [ 'System\CurrentControlSet\Control\ProductOptions',
'System\CurrentControlSet\Control\Server Applications',
'Software\Microsoft\Windows NT\CurrentVersion' ]
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine':
  ensure => present,
  type   => array,
  data   => $machine_array,
}

# rule_2.3.10.8_L1_Configure_Network_access_Remotely_accessible_registry_paths_and_sub-paths
$allowedpaths_array = [ 'System\CurrentControlSet\Control\Print\Printers',
'System\CurrentControlSet\Services\Eventlog',
'Software\Microsoft\OLAP Server',
'Software\Microsoft\Windows NT\CurrentVersion\Print',
'Software\Microsoft\Windows NT\CurrentVersion\Windows',
'System\CurrentControlSet\Control\ContentIndex',
'System\CurrentControlSet\Control\Terminal Server',
'System\CurrentControlSet\Control\Terminal Server\UserConfig',
'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration',
'Software\Microsoft\Windows NT\CurrentVersion\Perflib',
'System\CurrentControlSet\Services\SysmonLog' ]
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine':
  ensure => present,
  type   => array,
  data   => $allowedpaths_array,
}

# rule_2.3.10.9_L1_Ensure_Network_access_Restrict_anonymous_access_to_Named_Pipes_and_Shares_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.10.10_L1_Ensure_Network_access_Shares_that_can_be_accessed_anonymously_is_set_to_None
$nullsessionshares_array = []
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares':
  ensure => present,
  type   => array,
  data   => $nullsessionshares_array,
}

# rule_2.3.10.11_L1_Ensure_Network_access_Sharing_and_security_model_for_local_accounts_is_set_to_Classic_-_local_users_authenticate_as_themselves
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\ForceGuest':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.11.1_L1_Ensure_Network_security_Allow_Local_System_to_use_computer_identity_for_NTLM_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\UseMachineId':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.11.2_L1_Ensure_Network_security_Allow_LocalSystem_NULL_session_fallback_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\allownullsessionfallback':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.11.3_L1_Ensure_Network_Security_Allow_PKU2U_authentication_requests_to_this_computer_to_use_online_identities_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.11.4_L1_Ensure_Network_security_Configure_encryption_types_allowed_for_Kerberos_is_set_to_AES128_HMAC_SHA1_AES256_HMAC_SHA1_Future_encryption_types
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\SupportedEncryptionTypes':
  ensure => present,
  type   => dword,
  data   => 2147483640,
}

# rule_2.3.11.5_L1_Ensure_Network_security_Do_not_store_LAN_Manager_hash_value_on_next_password_change_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.11.6_L1_Ensure_Network_security_Force_logoff_when_logon_hours_expire_is_set_to_Enabled
# see rule_2.3.9.4

# rule_2.3.11.7_L1_Ensure_Network_security_LAN_Manager_authentication_level_is_set_to_Send_NTLMv2_response_only._Refuse_LM__NTLM
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel':
  ensure => present,
  type   => dword,
  data   => 5,
}

# rule_2.3.11.8_L1_Ensure_Network_security_LDAP_client_signing_requirements_is_set_to_Negotiate_signing_or_higher
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.11.9_L1_Ensure_Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_clients_is_set_to_Require_NTLMv2_session_security_Require_128-bit_encryption
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec':
  ensure => present,
  type   => dword,
  data   => 537395200,
}

# rule_2.3.11.10_L1_Ensure_Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_servers_is_set_to_Require_NTLMv2_session_security_Require_128-bit_encryption
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec':
  ensure => present,
  type   => dword,
  data   => 537395200,
}

# rule_2.3.13.1_L1_Ensure_Shutdown_Allow_system_to_be_shut_down_without_having_to_log_on_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.15.1_L1_Ensure_System_objects_Require_case_insensitivity_for_non-Windows_subsystems_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.15.2_L1_Ensure_System_objects_Strengthen_default_permissions_of_internal_system_objects_e.g._Symbolic_Links_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.1_L1_Ensure_User_Account_Control_Admin_Approval_Mode_for_the_Built-in_Administrator_account_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.2_L1_Ensure_User_Account_Control_Allow_UIAccess_applications_to_prompt_for_elevation_without_using_the_secure_desktop_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableUIADesktopToggle':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.17.3_L1_Ensure_User_Account_Control_Behavior_of_the_elevation_prompt_for_administrators_in_Admin_Approval_Mode_is_set_to_Prompt_for_consent_on_the_secure_desktop
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_2.3.17.4_L1_Ensure_User_Account_Control_Behavior_of_the_elevation_prompt_for_standard_users_is_set_to_Automatically_deny_elevation_requests
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_2.3.17.5_L1_Ensure_User_Account_Control_Detect_application_installations_and_prompt_for_elevation_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.6_L1_Ensure_User_Account_Control_Only_elevate_UIAccess_applications_that_are_installed_in_secure_locations_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.7_L1_Ensure_User_Account_Control_Run_all_administrators_in_Admin_Approval_Mode_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.8_L1_Ensure_User_Account_Control_Switch_to_the_secure_desktop_when_prompting_for_elevation_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_2.3.17.9_L1_Ensure_User_Account_Control_Virtualize_file_and_registry_write_failures_to_per-user_locations_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.1_L1_Ensure_Windows_Firewall_Domain_Firewall_state_is_set_to_On_recommended
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.2_L1_Ensure_Windows_Firewall_Domain_Inbound_connections_is_set_to_Block_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\DefaultInboundAction':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.3_L1_Ensure_Windows_Firewall_Domain_Outbound_connections_is_set_to_Allow_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\DefaultOutboundAction':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_9.1.4_L1_Ensure_Windows_Firewall_Domain_Settings_Display_a_notification_is_set_to_No
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\DisableNotifications':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.5_L1_Ensure_Windows_Firewall_Domain_Logging_Name_is_set_to_SYSTEMROOTSystem32logfilesfirewalldomainfw.log
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging\LogFilePath':
  ensure => present,
  type   => string,
  data   => '%windir%\system32\logfiles\firewall\domainfw.log',
}

registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\AllowLocalPolicyMerge':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.6_L1_Ensure_Windows_Firewall_Domain_Logging_Size_limit_KB_is_set_to_16384_KB_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging\LogFileSize':
  ensure => present,
  type   => dword,
  data   => 0x00004000,
}

# rule_9.1.7_L1_Ensure_Windows_Firewall_Domain_Logging_Log_dropped_packets_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging\LogDroppedPackets':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.1.8_L1_Ensure_Windows_Firewall_Domain_Logging_Log_successful_connections_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging\LogSuccessfulConnections':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.2.1_L1_Ensure_Windows_Firewall_Private_Firewall_state_is_set_to_On_recommended
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\EnableFirewall':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.2.2_L1_Ensure_Windows_Firewall_Private_Inbound_connections_is_set_to_Block_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultInboundAction':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.2.3_L1_Ensure_Windows_Firewall_Private_Outbound_connections_is_set_to_Allow_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultOutboundAction':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_9.2.4_L1_Ensure_Windows_Firewall_Private_Settings_Display_a_notification_is_set_to_No
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\DisableNotifications':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.2.5_L1_Ensure_Windows_Firewall_Private_Logging_Name_is_set_to_SYSTEMROOTSystem32logfilesfirewallprivatefw.log
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging\LogFilePath':
  ensure => present,
  type   => string,
  data   => '%systemroot%\system32\logfiles\firewall\privatefw.log',
}

# rule_9.2.6_L1_Ensure_Windows_Firewall_Private_Logging_Size_limit_KB_is_set_to_16384_KB_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging\LogFileSize':
  ensure => present,
  type   => dword,
  data   => 0x00004000,
}

# rule_9.2.7_L1_Ensure_Windows_Firewall_Private_Logging_Log_dropped_packets_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging\LogDroppedPackets':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.2.8_L1_Ensure_Windows_Firewall_Private_Logging_Log_successful_connections_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging\LogSuccessfulConnections':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.3.1_L1_Ensure_Windows_Firewall_Public_Firewall_state_is_set_to_On_recommended
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\EnableFirewall':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.3.2_L1_Ensure_Windows_Firewall_Public_Inbound_connections_is_set_to_Block_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultInboundAction':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.3.3_L1_Ensure_Windows_Firewall_Public_Outbound_connections_is_set_to_Allow_default
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultOutboundAction':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_9.3.4_L1_Ensure_Windows_Firewall_Public_Settings_Display_a_notification_is_set_to_No
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\DisableNotifications':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.3.5_L1_Ensure_Windows_Firewall_Public_Settings_Apply_local_firewall_rules_is_set_to_No
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalPolicyMerge':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_9.3.6_L1_Ensure_Windows_Firewall_Public_Settings_Apply_local_connection_security_rules_is_set_to_No
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalIPsecPolicyMerge':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_9.3.7_L1_Ensure_Windows_Firewall_Public_Logging_Name_is_set_to_SYSTEMROOTSystem32logfilesfirewallpublicfw.log
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging\LogFilePath':
  ensure => present,
  type   => string,
  data   => '%systemroot%\system32\logfiles\firewall\publicfw.log',
}

# rule_9.3.8_L1_Ensure_Windows_Firewall_Public_Logging_Size_limit_KB_is_set_to_16384_KB_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging\LogFileSize':
  ensure => present,
  type   => dword,
  data   => 0x00004000,
}

# rule_9.3.9_L1_Ensure_Windows_Firewall_Public_Logging_Log_dropped_packets_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging\LogDroppedPackets':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_9.3.10_L1_Ensure_Windows_Firewall_Public_Logging_Log_successful_connections_is_set_to_Yes
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging\LogSuccessfulConnections':
  ensure => present,
  type   => dword,
  data   => 1,
}


# rule_17.1.1_L1_Ensure_Audit_Credential_Validation_is_set_to_Success_and_Failure
# rule_17.2.1_L1_Ensure_Audit_Application_Group_Management_is_set_to_Success_and_Failure
# rule_17.2.2_L1_Ensure_Audit_Computer_Account_Management_is_set_to_Success_and_Failure
# rule_17.2.4_L1_Ensure_Audit_Other_Account_Management_Events_is_set_to_Success_and_Failure
# rule_17.2.5_L1_Ensure_Audit_Security_Group_Management_is_set_to_Success_and_Failure
# rule_17.2.6_L1_Ensure_Audit_User_Account_Management_is_set_to_Success_and_Failure
# rule_17.3.1_L1_Ensure_Audit_Process_Creation_is_set_to_Success
# rule_17.5.1_L1_Ensure_Audit_Account_Lockout_is_set_to_Success_and_Failure
# rule_17.5.2_L1_Ensure_Audit_Logoff_is_set_to_Success
# rule_17.5.3_L1_Ensure_Audit_Logon_is_set_to_Success_and_Failure
# rule_17.5.4_L1_Ensure_Audit_Other_LogonLogoff_Events_is_set_to_Success_and_Failure
# rule_17.5.5_L1_Ensure_Audit_Special_Logon_is_set_to_Success
# rule_17.6.1_L1_Ensure_Audit_Other_Object_Access_Events_is_set_to_Success_and_Failure
# rule_17.6.2_L1_Ensure_Audit_Removable_Storage_is_set_to_Success_and_Failure
# rule_17.7.1_L1_Ensure_Audit_Audit_Policy_Change_is_set_to_Success_and_Failure
# rule_17.7.2_L1_Ensure_Audit_Authentication_Policy_Change_is_set_to_Success
# rule_17.7.3_L1_Ensure_Audit_Authorization_Policy_Change_is_set_to_Success
# rule_17.8.1_L1_Ensure_Audit_Sensitive_Privilege_Use_is_set_to_Success_and_Failure
# rule_17.9.1_L1_Ensure_Audit_IPsec_Driver_is_set_to_Success_and_Failure
# rule_17.9.2_L1_Ensure_Audit_Other_System_Events_is_set_to_Success_and_Failure
# rule_17.9.3_L1_Ensure_Audit_Security_State_Change_is_set_to_Success
# rule_17.9.4_L1_Ensure_Audit_Security_System_Extension_is_set_to_Success_and_Failure
# rule_17.9.5_L1_Ensure_Audit_System_Integrity_is_set_to_Success_and_Failure

# rule_18.1.1.1_L1_Ensure_Prevent_enabling_lock_screen_camera_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoLockScreenCamera':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.1.1.2_L1_Ensure_Prevent_enabling_lock_screen_slide_show_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreenSlideshow':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.2.1_L1_Ensure_LAPS_AdmPwd_GPO_Extension__CSE_is_installed_MS_only


# rule_18.2.2_L1_Ensure_Do_not_allow_password_expiration_time_longer_than_required_by_policy_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\PwdExpirationProtectionEnabled':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.2.3_L1_Ensure_Enable_Local_Admin_Password_Management_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\AdmPwdEnabled':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.2.4_L1_Ensure_Password_Settings_Password_Complexity_is_set_to_Enabled_Large_letters__small_letters__numbers__special_characters_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\PasswordComplexity':
  ensure => present,
  type   => dword,
  data   => 4,
}

# rule_18.2.5_L1_Ensure_Password_Settings_Password_Length_is_set_to_Enabled_15_or_more_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\PasswordLength':
  ensure => present,
  type   => dword,
  data   => 15,
}

# rule_18.2.6_L1_Ensure_Password_Settings_Password_Age_Days_is_set_to_Enabled_30_or_fewer_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\PasswordAgeDays':
  ensure => present,
  type   => dword,
  data   => 30,
}

# rule_18.3.1_L1_Ensure_Apply_UAC_restrictions_to_local_accounts_on_network_logons_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.3.2_L1_Ensure_Configure_SMB_v1_client_driver_is_set_to_Enabled_Disable_driver
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10\Start':
  ensure => present,
  type   => dword,
  data   => 4,
}

# rule_18.3.3_L1_Ensure_Configure_SMB_v1_server_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMB1':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.3.4_L1_Ensure_Enable_Structured_Exception_Handling_Overwrite_Protection_SEHOP_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\DisableExceptionChainValidation':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.3.5_L1_Ensure_WDigest_Authentication_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest\UseLogonCredential':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.4.1_L1_Ensure_MSS_AutoAdminLogon_Enable_Automatic_Logon_not_recommended_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_18.4.2_L1_Ensure_MSS_DisableIPSourceRouting_IPv6_IP_source_routing_protection_level_protects_against_packet_spoofing_is_set_to_Enabled_Highest_protection_source_routing_is_completely_disabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisableIPSourceRouting':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_18.4.3_L1_Ensure_MSS_DisableIPSourceRouting_IP_source_routing_protection_level_protects_against_packet_spoofing_is_set_to_Enabled_Highest_protection_source_routing_is_completely_disabled
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\DisableIPSourceRouting':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_18.4.4_L1_Ensure_MSS_EnableICMPRedirect_Allow_ICMP_redirects_to_override_OSPF_generated_routes_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\EnableICMPRedirect':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.4.6_L1_Ensure_MSS_NoNameReleaseOnDemand_Allow_the_computer_to_ignore_NetBIOS_name_release_requests_except_from_WINS_servers_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\NoNameReleaseOnDemand':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.4.8_L1_Ensure_MSS_SafeDllSearchMode_Enable_Safe_DLL_search_mode_recommended_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\SafeDllSearchMode':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.4.9_L1_Ensure_MSS_ScreenSaverGracePeriod_The_time_in_seconds_before_the_screen_saver_grace_period_expires_0_recommended_is_set_to_Enabled_5_or_fewer_seconds
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScreenSaverGracePeriod':
  ensure => present,
  type   => string,
  data   => '5',
}

# rule_18.4.12_L1_Ensure_MSS_WarningLevel_Percentage_threshold_for_the_security_event_log_at_which_the_system_will_generate_a_warning_is_set_to_Enabled_90_or_less
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security\WarningLevel':
  ensure => present,
  type   => dword,
  data   => 90,
}

# rule_18.5.4.1_L1_Set_NetBIOS_node_type_to_P-node_Ensure_NetBT_Parameter_NodeType_is_set_to_0x2_2_MS_Only
registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netbt\Parameters\NodeType':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_18.5.4.2_L1_Ensure_Turn_off_multicast_name_resolution_is_set_to_Enabled_MS_Only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\EnableMulticast':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.5.11.2_L1_Ensure_Prohibit_installation_and_configuration_of_Network_Bridge_on_your_DNS_domain_network_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_AllowNetBridge_NLA':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.5.11.3_L1_Ensure_Require_domain_users_to_elevate_when_setting_a_networks_location_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_StdDomainUserSetLocation':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.5.14.1_L1_Ensure_Hardened_UNC_Paths_is_set_to_Enabled_with_Require_Mutual_Authentication_and_Require_Integrity_set_for_all_NETLOGON_and_SYSVOL_shares
registry::value { '\\\\*\\NETLOGON':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
    data => 'RequireMutualAuthentication=1, RequireIntegrity=1',
}
registry::value { '\\\\*\\SYSVOL':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
    data => 'RequireMutualAuthentication=1, RequireIntegrity=1',
}

# rule_18.5.21.1_L1_Ensure_Minimize_the_number_of_simultaneous_connections_to_the_Internet_or_a_Windows_Domain_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy\fMinimizeConnections':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.3.1_L1_Ensure_Include_command_line_in_process_creation_events_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit\ProcessCreationIncludeCmdLine_Enabled':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.4.1_L1_Ensure_Remote_host_allows_delegation_of_non-exportable_credentials_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\AllowProtectedCreds':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.14.1_L1_Ensure_Boot-Start_Driver_Initialization_Policy_is_set_to_Enabled_Good_unknown_and_bad_but_critical
registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch\DriverLoadPolicy':
  ensure => present,
  type   => dword,
  data   => 3,
}

# rule_18.8.21.2_L1_Ensure_Configure_registry_policy_processing_Do_not_apply_during_periodic_background_processing_is_set_to_Enabled_FALSE
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoBackgroundPolicy':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.21.3_L1_Ensure_Configure_registry_policy_processing_Process_even_if_the_Group_Policy_objects_have_not_changed_is_set_to_Enabled_TRUE
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoGPOListChanges':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.21.4_L1_Ensure_Turn_off_background_refresh_of_Group_Policy_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DisableBkGndGroupPolicy':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.22.1.1_L1_Ensure_Turn_off_downloading_of_print_drivers_over_HTTP_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\DisableWebPnPDownload':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.22.1.5_L1_Ensure_Turn_off_Internet_download_for_Web_publishing_and_online_ordering_wizards_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWebServices':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.22.1.6_L1_Ensure_Turn_off_printing_over_HTTP_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\DisableHTTPPrinting':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.27.1_L1_Ensure_Do_not_display_network_selection_UI_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\DontDisplayNetworkSelectionUI':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.27.2_L1_Ensure_Do_not_enumerate_connected_users_on_domain-joined_computers_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\DontEnumerateConnectedUsers':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.27.3_L1_Ensure_Enumerate_local_users_on_domain-joined_computers_is_set_to_Disabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\EnumerateLocalUsers':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.27.4_L1_Ensure_Turn_off_app_notifications_on_the_lock_screen_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\DisableLockScreenAppNotifications':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.27.5_L1_Ensure_Turn_off_picture_password_sign-in_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\BlockDomainPicturePassword':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.27.6_L1_Ensure_Turn_on_convenience_PIN_sign-in_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\AllowDomainPINLogon':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.33.6.1_L1_Ensure_Require_a_password_when_a_computer_wakes_on_battery_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\DCSettingIndex':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.33.6.2_L1_Ensure_Require_a_password_when_a_computer_wakes_plugged_in_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\ACSettingIndex':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.8.35.1_L1_Ensure_Configure_Offer_Remote_Assistance_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\fAllowUnsolicited':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.35.2_L1_Ensure_Configure_Solicited_Remote_Assistance_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\fAllowToGetHelp':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.8.36.1_L1_Ensure_Enable_RPC_Endpoint_Mapper_Client_Authentication_is_set_to_Enabled_MS_only
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc\EnableAuthEpResolution':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.6.1_L1_Ensure_Allow_Microsoft_accounts_to_be_optional_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\MSAOptional':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.8.1_L1_Ensure_Disallow_Autoplay_for_non-volume_devices_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer\NoAutoplayfornonVolume':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.8.2_L1_Ensure_Set_the_default_behavior_for_AutoRun_is_set_to_Enabled_Do_not_execute_any_autorun_commands
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAutorun':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.8.3_L1_Ensure_Turn_off_Autoplay_is_set_to_Enabled_All_drives
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun':
  ensure => present,
  type   => dword,
  data   => 255,
}

# rule_18.9.15.1_L1_Ensure_Do_not_display_the_password_reveal_button_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI\DisablePasswordReveal':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.15.2_L1_Ensure_Enumerate_administrator_accounts_on_elevation_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI\EnumerateAdministrators':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.24.1_L1_Ensure_EMET_5.52_or_higher_is_installed

# rule_18.9.24.2_L1_Ensure_Default_Action_and_Mitigation_Settings_is_set_to_Enabled_plus_subsettings
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\AntiDetours':
  ensure => present,
  type   => dword,
  data   => 1,
}
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\BannedFunctions':
  ensure => present,
  type   => dword,
  data   => 1,
}
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\DeepHooks':
  ensure => present,
  type   => dword,
  data   => 1,
}
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\ExploitAction':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.24.3_L1_Ensure_Default_Protections_for_Internet_Explorer_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\EMET\Defaults\IE':
  ensure => present,
  type   => string,
  data   => '*\Internet Explorer\iexplore.exe',
}
registry::value { '*\Internet Explorer\iexplore.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+EAF+ eaf_modules:mshtml.dll;flash*.ocx;jscript*.dll;vbscript.dll;vgx.dll +ASR asr_modules:npjpi*.dll;jp2iexp.dll;vgx.dll;msxml4*.dll;wshom.ocx;scrrun.dll;vbscript.dll asr_zones:1;2',
}

# rule_18.9.24.4_L1_Ensure_Default_Protections_for_Popular_Software_is_set_to_Enabled
registry::value { '*\7-Zip\7z.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-EAF',
}
registry::value { '*\7-Zip\7zFM.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-EAF',
}
registry::value { '*\7-Zip\7zG.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-EAF',
}
registry::value { '*\Adobe\Adobe Photoshop CS*\Photoshop.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Foxit Reader\Foxit Reader.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-EAF',
}
registry::value { '*\Google\Chrome\Application\chrome.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+EAF+ eaf_modules:chrome_child.dll',
}
registry::value { '*\Google\Google Talk\googletalk.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-DEP',
}
registry::value { '*\iTunes\iTunes.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Microsoft Lync\communicator.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\mIRC\mirc.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Mozilla Firefox\firefox.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+EAF+ eaf_modules:mozjs.dll;xul.dll',
}
registry::value { '*\Mozilla Firefox\plugin-container.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Mozilla Thunderbird\plugin-container.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Mozilla Thunderbird\thunderbird.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Opera\*\opera.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Pidgin\pidgin.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\QuickTime\QuickTimePlayer.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Real\RealPlayer\realconverter.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Real\RealPlayer\realplay.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Safari\Safari.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\SkyDrive\SkyDrive.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Skype\Phone\Skype.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\VideoLAN\VLC\vlc.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Winamp\winamp.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Windows Live\Mail\wlmail.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Windows Live\Photo Gallery\WLXPhotoGallery.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Windows Live\Writer\WindowsLiveWriter.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\Windows Media Player\wmplayer.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-EAF -MandatoryASLR',
}
registry::value { '*\WinRAR\rar.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\WinRAR\unrar.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\WinRAR\winrar.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\WinZip\winzip32.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\WinZip\winzip64.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}

# rule_18.9.24.5_L1_Ensure_Default_Protections_for_Recommended_Software_is_set_to_Enabled
registry::value { '*\Adobe\*\Reader\AcroRd32.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api',
}
registry::value { '*\Adobe\Acrobat*\Acrobat\Acrobat.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api',
}
registry::value { '*\Java\jre*\bin\java.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-HeapSpray',
}
registry::value { '*\Java\jre*\bin\javaw.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-HeapSpray',
}
registry::value { '*\Java\jre*\bin\javaws.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '-HeapSpray',
}
registry::value { '*\OFFICE1*\EXCEL.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+ASR asr_modules:flash*.ocx',
}
registry::value { '*\OFFICE1*\INFOPATH.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\LYNC.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\MSACCESS.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\MSPUB.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\OIS.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\OUTLOOK.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\POWERPNT.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+ASR asr_modules:flash*.ocx',
}
registry::value { '*\OFFICE1*\PPTVIEW.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\VISIO.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\VPREVIEW.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}
registry::value { '*\OFFICE1*\WINWORD.EXE':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '+ASR asr_modules:flash*.ocx',
}
registry::value { '*\Windows NT\Accessories\wordpad.exe':
    key  => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
    data => '',
}

# rule_18.9.24.6_L1_Ensure_System_ASLR_is_set_to_Enabled_Application_Opt-In
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\ASLR':
  ensure => present,
  type   => dword,
  data   => 3,
}

# rule_18.9.24.7_L1_Ensure_System_DEP_is_set_to_Enabled_Application_Opt-Out
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\DEP':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_18.9.24.8_L1_Ensure_System_SEHOP_is_set_to_Enabled_Application_Opt-Out
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings\SEHOP':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_18.9.26.1.1_L1_Ensure_Application_Control_Event_Log_behavior_when_the_log_file_reaches_its_maximum_size_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\Retention':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_18.9.26.1.2_L1_Ensure_Application_Specify_the_maximum_log_file_size_KB_is_set_to_Enabled_32768_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\MaxSize':
  ensure => present,
  type   => dword,
  data   => 32768,
}

# rule_18.9.26.2.1_L1_Ensure_Security_Control_Event_Log_behavior_when_the_log_file_reaches_its_maximum_size_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\Retention':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_18.9.26.2.2_L1_Ensure_Security_Specify_the_maximum_log_file_size_KB_is_set_to_Enabled_196608_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\MaxSize':
  ensure => present,
  type   => dword,
  data   => 196608,
}

# rule_18.9.26.3.1_L1_Ensure_Setup_Control_Event_Log_behavior_when_the_log_file_reaches_its_maximum_size_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Setup\Retention':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_18.9.26.3.2_L1_Ensure_Setup_Specify_the_maximum_log_file_size_KB_is_set_to_Enabled_32768_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Setup\MaxSize':
  ensure => present,
  type   => dword,
  data   => 32768,
}

# rule_18.9.26.4.1_L1_Ensure_System_Control_Event_Log_behavior_when_the_log_file_reaches_its_maximum_size_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\Retention':
  ensure => present,
  type   => string,
  data   => '0',
}

# rule_18.9.26.4.2_L1_Ensure_System_Specify_the_maximum_log_file_size_KB_is_set_to_Enabled_32768_or_greater
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\MaxSize':
  ensure => present,
  type   => dword,
  data   => 32768,
}

# rule_18.9.30.2_L1_Ensure_Turn_off_Data_Execution_Prevention_for_Explorer_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer\NoDataExecutionPrevention':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.30.3_L1_Ensure_Turn_off_heap_termination_on_corruption_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer\NoHeapTerminationOnCorruption':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.30.4_L1_Ensure_Turn_off_shell_protocol_protected_mode_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\PreXPSP2ShellProtocolBehavior':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.52.1_L1_Ensure_Prevent_the_usage_of_OneDrive_for_file_storage_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.52.2_L1_Ensure_Prevent_the_usage_of_OneDrive_for_file_storage_on_Windows_8.1_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSync':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.2.2_L1_Ensure_Do_not_allow_passwords_to_be_saved_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\DisablePasswordSaving':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.3.3.2_L1_Ensure_Do_not_allow_drive_redirection_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\fDisableCdm':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.3.9.1_L1_Ensure_Always_prompt_for_password_upon_connection_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\fPromptForPassword':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.3.9.2_L1_Ensure_Require_secure_RPC_communication_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\fEncryptRPCTraffic':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.3.9.3_L1_Ensure_Set_client_connection_encryption_level_is_set_to_Enabled_High_Level
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\MinEncryptionLevel':
  ensure => present,
  type   => dword,
  data   => 3,
}

# rule_18.9.58.3.11.1_L1_Ensure_Do_not_delete_temp_folders_upon_exit_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\DeleteTempDirsOnExit':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.58.3.11.2_L1_Ensure_Do_not_use_temporary_folders_per_session_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\PerSessionTempDir':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.59.1_L1_Ensure_Prevent_downloading_of_enclosures_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds\DisableEnclosureDownload':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.60.2_L1_Ensure_Allow_indexing_of_encrypted_files_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowIndexingEncryptedStoresOrItems':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.76.3.1_L1_Ensure_Configure_local_setting_override_for_reporting_to_Microsoft_MAPS_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet\LocalSettingOverrideSpynetReporting':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.76.7.1_L1_Ensure_Turn_on_behavior_monitoring_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableBehaviorMonitoring':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.76.10.1_L1_Ensure_Scan_removable_drives_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan\DisableRemovableDriveScanning':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.76.10.2_L1_Ensure_Turn_on_e-mail_scanning_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan\DisableEmailScanning':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.76.14_L1_Ensure_Turn_off_Windows_Defender_AntiVirus_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.80.1.1_L1_Ensure_Configure_Windows_Defender_SmartScreen_is_set_to_Enabled_Warn_and_prevent_bypass
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\EnableSmartScreen':
  ensure => present,
  type   => dword,
  data   => 1,
}
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\PhishingFilter\PreventOverride':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.81.2.1_L1_Ensure_Configure_Default_consent_is_set_to_Enabled_Always_ask_before_sending_data
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent\DefaultConsent':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.81.3_L1_Ensure_Automatically_send_memory_dumps_for_OS-generated_error_reports_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\AutoApproveOSDumps':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.85.1_L1_Ensure_Allow_user_control_over_installs_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer\EnableUserControl':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.85.2_L1_Ensure_Always_install_with_elevated_privileges_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.86.1_L1_Ensure_Sign-in_last_interactive_user_automatically_after_a_system-initiated_restart_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system\DisableAutomaticRestartSignOn':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.95.1_L1_Ensure_Turn_on_PowerShell_Script_Block_Logging_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\EnableScriptBlockLogging':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.95.2_L1_Ensure_Turn_on_PowerShell_Transcription_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription\EnableTranscripting':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.1.1_L1_Ensure_Allow_Basic_authentication_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client\AllowBasic':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.1.2_L1_Ensure_Allow_unencrypted_traffic_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client\AllowUnencryptedTraffic':
  ensure => present,
  type   => dword,
  data   => 0,
}
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\AllowUnencryptedTraffic':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.1.3_L1_Ensure_Disallow_Digest_authentication_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client\AllowDigest':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.2.1_L1_Ensure_Allow_Basic_authentication_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service\AllowBasic':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.2.3_L1_Ensure_Allow_unencrypted_traffic_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\AllowAutoConfig':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.97.2.4_L1_Ensure_Disallow_WinRM_from_storing_RunAs_credentials_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service\DisableRunAs':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_18.9.101.2_L1_Ensure_Configure_Automatic_Updates_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.101.3_L1_Ensure_Configure_Automatic_Updates_Scheduled_install_day_is_set_to_0_-_Every_day
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\ScheduledInstallDay':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_18.9.101.4_L1_Ensure_No_auto-restart_with_logged_on_users_for_scheduled_automatic_updates_installations_is_set_to_Disabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoRebootWithLoggedOnUsers':
  ensure => present,
  type   => dword,
  data   => 0,
}

# rule_19.1.3.1_L1_Ensure_Enable_screen_saver_is_set_to_Enabled
registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop\ScreenSaveActive':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_19.1.3.2_L1_Ensure_Force_specific_screen_saver_Screen_saver_executable_name_is_set_to_Enabled_scrnsave.scr
registry_value { 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel\Desktop\SCRNSAVE.EXE':
  ensure => present,
  type   => string,
  data   => 'scrnsave.scr',
}

# rule_19.1.3.3_L1_Ensure_Password_protect_the_screen_saver_is_set_to_Enabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel\Desktop\ScreenSaverIsSecure':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_19.1.3.4_L1_Ensure_Screen_saver_timeout_is_set_to_Enabled_900_seconds_or_fewer_but_not_0
registry_value { 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel\Desktop\ScreenSaveTimeOut':
  ensure => present,
  type   => dword,
  data   => 900,
}

# rule_19.5.1.1_L1_Ensure_Turn_off_toast_notifications_on_the_lock_screen_is_set_to_Enabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications\NoToastApplicationNotificationOnLockScreen':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_19.7.4.1_L1_Ensure_Do_not_preserve_zone_information_in_file_attachments_is_set_to_Disabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\SaveZoneInformation':
  ensure => present,
  type   => dword,
  data   => 2,
}

# rule_19.7.4.2_L1_Ensure_Notify_antivirus_programs_when_opening_attachments_is_set_to_Enabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\ScanWithAntiVirus':
  ensure => present,
  type   => dword,
  data   => 3,
}

# rule_19.7.26.1_L1_Ensure_Prevent_users_from_sharing_files_within_their_profile._is_set_to_Enabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoInplaceSharing':
  ensure => present,
  type   => dword,
  data   => 1,
}

# rule_19.7.40.1_L1_Ensure_Always_install_with_elevated_privileges_is_set_to_Disabled
registry_value { 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated':
  ensure => present,
  type   => dword,
  data   => 0,
}
}

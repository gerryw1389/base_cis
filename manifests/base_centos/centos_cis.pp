# Settings to fix the checks that failed

class base_cis::base_centos::centos_cis {

# rule_1_4_2_ensure_bootloader_password_is_set
exec { 'rule_1_4_2_ensure_bootloader_password_is_set':
  command  => file('base_cis/linux/fix_rule_1_4_2_ensure_bootloader_password_is_set.sh'),
  unless   => file('base_cis/linux/test_rule_1_4_2_ensure_bootloader_password_is_set.sh'),
  provider => shell,
}

# rule_1_4_3_ensure_authentication_required_for_single_user_mode
exec { 'rule_1_4_3_ensure_authentication_required_for_single_user_mode':
  command  => file('base_cis/linux/fix_rule_1_4_3_ensure_authentication_required_for_single_user_mode.sh'),
  unless   => file('base_cis/linux/test_rule_1_4_3_ensure_authentication_required_for_single_user_mode.sh'),
  provider => shell,
}

# rule_2_2_1_2_ensure_ntp_is_configured
exec { 'rule_2_2_1_2_ensure_ntp_is_configured':
  command  => file('base_cis/linux/fix_rule_2_2_1_2_ensure_ntp_is_configured.sh'),
  unless   => file('base_cis/linux/test_rule_2_2_1_2_ensure_ntp_is_configured.sh'),
  provider => shell,
}

# rule_3_6_3_ensure_loopback_traffic_is_configured
exec { 'rule_3_6_3_ensure_loopback_traffic_is_configured':
  command  => file('base_cis/linux/fix_rule_3_6_3_ensure_loopback_traffic_is_configured.sh'),
  unless   => file('base_cis/linux/test_rule_3_6_3_ensure_loopback_traffic_is_configured.sh'),
  provider => shell,
}

# rule_3_6_5_ensure_firewall_rules_exist_for_all_open_ports
exec { 'rule_3_6_5_ensure_firewall_rules_exist_for_all_open_ports':
  command  => file('base_cis/linux/fix_rule_3_6_5_ensure_firewall_rules_exist_for_all_open_ports.sh'),
  unless   => file('base_cis/linux/test_rule_3_6_5_ensure_firewall_rules_exist_for_all_open_ports.sh'),
  provider => shell,
}

# rule_4_2_1_3_ensure_rsyslog_default_file_permissions_configured
exec { 'rule_4_2_1_3_ensure_rsyslog_default_file_permissions_configured':
  command  => file('base_cis/linux/fix_rule_4_2_1_3_ensure_rsyslog_default_file_permissions_configured.sh'),
  unless   => file('base_cis/linux/test_rule_4_2_1_3_ensure_rsyslog_default_file_permissions_configured.sh'),
  provider => shell,
}

# rule_4_2_1_4_ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host
exec { 'rule_4_2_1_4_ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host':
  command  => file('base_cis/linux/fix_rule_4_2_1_4_ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host.sh'),
  unless   => file('base_cis/linux/test_rule_4_2_1_4_ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host.sh'),
  provider => shell,
}

# rule_5_2_14_ensure_ssh_access_is_limited
exec { 'rule_5_2_14_ensure_ssh_access_is_limited':
  command  => file('base_cis/linux/fix_rule_5_2_14_ensure_ssh_access_is_limited.sh'),
  unless   => file('base_cis/linux/test_rule_5_2_14_ensure_ssh_access_is_limited.sh'),
  provider => shell,
}

# rule_5_3.1_ensure_password_creation_requirements_are_configured
exec { 'rule_5_3_1_ensure_password_creation_requirements_are_configured':
  command  => file('base_cis/linux/fix_rule_5_3_1_ensure_password_creation_requirements_are_configured.sh'),
  unless   => file('base_cis/linux/test_rule_5_3_1_ensure_password_creation_requirements_are_configured.sh'),
  provider => shell,
}

# rule_5_3_2_ensure_lockout_for_failed_password_attempts_is_configured
exec { 'rule_5_3_2_ensure_lockout_for_failed_password_attempts_is_configured':
  command  => file('base_cis/linux/fix_rule_5_3_2_ensure_lockout_for_failed_password_attempts_is_configured.sh'),
  unless   => file('base_cis/linux/test_rule_5_3_2_ensure_lockout_for_failed_password_attempts_is_configured.sh'),
  provider => shell,
}

# rule_5_3_3_ensure_password_reuse_is_limited
exec { 'rule_5_3_3_ensure_password_reuse_is_limited':
  command  => file('base_cis/linux/fix_rule_5_3_3_ensure_password_reuse_is_limited.sh'),
  unless   => file('base_cis/linux/test_rule_5_3_3_ensure_password_reuse_is_limited.sh'),
  provider => shell,
}

# rule_5_3_4_ensure_password_hashing_algorithm_is_sha_512
exec { 'rule_5_3_4_ensure_password_hashing_algorithm_is_sha_512':
  command  => file('base_cis/linux/fix_rule_5_3_4_ensure_password_hashing_algorithm_is_sha_512.sh'),
  unless   => file('base_cis/linux/test_rule_5_3_4_ensure_password_hashing_algorithm_is_sha_512.sh'),
  provider => shell,
}

# rule_5_4_1_1_ensure_password_expiration_is_365_days_or_less
exec { 'rule_5_4_1_1_ensure_password_expiration_is_365_days_or_less':
  command  => file('base_cis/linux/fix_rule_5_4_1_1_ensure_password_expiration_is_365_days_or_less.sh'),
  unless   => file('base_cis/linux/test_rule_5_4_1_1_ensure_password_expiration_is_365_days_or_less.sh'),
  provider => shell,
}

# rule_5_4_1_2_ensure_minimum_days_between_password_changes_is_7_or_more
exec { 'rule_5_4_1_2_ensure_minimum_days_between_password_changes_is_7_or_more':
  command  => file('base_cis/linux/fix_rule_5_4_1_2_ensure_minimum_days_between_password_changes_is_7_or_more.sh'),
  unless   => file('base_cis/linux/test_rule_5_4_1_2_ensure_minimum_days_between_password_changes_is_7_or_more.sh'),
  provider => shell,
}

# rule_5_4_4_ensure_default_user_umask_is_027_or_more_restrictive
exec { 'rule_5_4_4_ensure_default_user_umask_is_027_or_more_restrictive':
  command  => file('base_cis/linux/fix_rule_5_4_4_ensure_default_user_umask_is_027_or_more_restrictive.sh'),
  unless   => file('base_cis/linux/test_rule_5_4_4_ensure_default_user_umask_is_027_or_more_restrictive.sh'),
  provider => shell,
}

# rule_6_1_10_ensure_no_world_writable_files_exist
exec { 'rule_6_1_10_ensure_no_world_writable_files_exist':
  command  => file('base_cis/linux/fix_rule_6_1_10_ensure_no_world_writable_files_exist.sh'),
  unless   => file('base_cis/linux/test_rule_6_1_10_ensure_no_world_writable_files_exist.sh'),
  provider => shell,
}

}

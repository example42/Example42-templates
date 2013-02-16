# = Class: standard42
#
# This is the main standard42 class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, standard42 class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $standard42_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, standard42 main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $standard42_source
#
# [*source_dir*]
#   If defined, the whole standard42 configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $standard42_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $standard42_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, standard42 main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $standard42_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $standard42_options
#
# [*service_autorestart*]
#   Automatically restarts the standard42 service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $standard42_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $standard42_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $standard42_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $standard42_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for standard42 checks
#   Can be defined also by the (top scope) variables $standard42_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $standard42_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $standard42_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $standard42_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $standard42_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for standard42 port(s)
#   Can be defined also by the (top scope) variables $standard42_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling standard42. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $standard42_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $standard42_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $standard42_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $standard42_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in standard42::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of standard42 package
#
# [*service*]
#   The name of standard42 service
#
# [*service_status*]
#   If the standard42 service init script supports status argument
#
# [*process*]
#   The name of standard42 process
#
# [*process_args*]
#   The name of standard42 arguments. Used by puppi and monitor.
#   Used only in case the standard42 process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user standard42 runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $standard42_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $standard42_protocol
#
#
# See README for usage patterns.
#
class standard42 (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits standard42::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $standard42::bool_absent ? {
    true  => 'absent',
    false => $standard42::version,
  }

  $manage_service_enable = $standard42::bool_disableboot ? {
    true    => false,
    default => $standard42::bool_disable ? {
      true    => false,
      default => $standard42::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $standard42::bool_disable ? {
    true    => 'stopped',
    default =>  $standard42::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $standard42::bool_service_autorestart ? {
    true    => Service[standard42],
    false   => undef,
  }

  $manage_file = $standard42::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $standard42::bool_absent == true
  or $standard42::bool_disable == true
  or $standard42::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $standard42::bool_absent == true
  or $standard42::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $standard42::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $standard42::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $standard42::source ? {
    ''        => undef,
    default   => $standard42::source,
  }

  $manage_file_content = $standard42::template ? {
    ''        => undef,
    default   => template($standard42::template),
  }

  ### Managed resources
  package { $standard42::package:
    ensure  => $standard42::manage_package,
    noop    => $standard42::bool_noops,
  }

  service { 'standard42':
    ensure     => $standard42::manage_service_ensure,
    name       => $standard42::service,
    enable     => $standard42::manage_service_enable,
    hasstatus  => $standard42::service_status,
    pattern    => $standard42::process,
    require    => Package[$standard42::package],
    noop       => $standard42::bool_noops,
  }

  file { 'standard42.conf':
    ensure  => $standard42::manage_file,
    path    => $standard42::config_file,
    mode    => $standard42::config_file_mode,
    owner   => $standard42::config_file_owner,
    group   => $standard42::config_file_group,
    require => Package[$standard42::package],
    notify  => $standard42::manage_service_autorestart,
    source  => $standard42::manage_file_source,
    content => $standard42::manage_file_content,
    replace => $standard42::manage_file_replace,
    audit   => $standard42::manage_audit,
    noop    => $standard42::bool_noops,
  }

  # The whole standard42 configuration directory can be recursively overriden
  if $standard42::source_dir {
    file { 'standard42.dir':
      ensure  => directory,
      path    => $standard42::config_dir,
      require => Package[$standard42::package],
      notify  => $standard42::manage_service_autorestart,
      source  => $standard42::source_dir,
      recurse => true,
      purge   => $standard42::bool_source_dir_purge,
      force   => $standard42::bool_source_dir_purge,
      replace => $standard42::manage_file_replace,
      audit   => $standard42::manage_audit,
      noop    => $standard42::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $standard42::my_class {
    include $standard42::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $standard42::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'standard42':
      ensure    => $standard42::manage_file,
      variables => $classvars,
      helper    => $standard42::puppi_helper,
      noop      => $standard42::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $standard42::bool_monitor == true {
    if $standard42::port != '' {
      monitor::port { "standard42_${standard42::protocol}_${standard42::port}":
        protocol => $standard42::protocol,
        port     => $standard42::port,
        target   => $standard42::monitor_target,
        tool     => $standard42::monitor_tool,
        enable   => $standard42::manage_monitor,
        noop     => $standard42::bool_noops,
      }
    }
    if $standard42::service != '' {
      monitor::process { 'standard42_process':
        process  => $standard42::process,
        service  => $standard42::service,
        pidfile  => $standard42::pid_file,
        user     => $standard42::process_user,
        argument => $standard42::process_args,
        tool     => $standard42::monitor_tool,
        enable   => $standard42::manage_monitor,
        noop     => $standard42::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $standard42::bool_firewall == true and $standard42::port != '' {
    firewall { "standard42_${standard42::protocol}_${standard42::port}":
      source      => $standard42::firewall_src,
      destination => $standard42::firewall_dst,
      protocol    => $standard42::protocol,
      port        => $standard42::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $standard42::firewall_tool,
      enable      => $standard42::manage_firewall,
      noop        => $standard42::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $standard42::bool_debug == true {
    file { 'debug_standard42':
      ensure  => $standard42::manage_file,
      path    => "${settings::vardir}/debug-standard42",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $standard42::bool_noops,
    }
  }

}

# = Class: standard
#
# This is the main standard class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, standard class will automatically "include $my_class"
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, standard main config file will have the param: source => $source
#
# [*source_dir*]
#   If defined, the whole standard configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, standard main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#
# [*service_autorestart*]
#   Automatically restarts the standard service when there is a change in
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
#   Set to 'true' to remove all the resources installed by the module
#   Default: false
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module. Default: false
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Default: false
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet. Default: false
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
class standard (
  $my_class            = '',
  $source              = '',
  $source_dir          = '',
  $source_dir_purge    = '',
  $template            = '',
  $service_autorestart = false,
  $options             = '',
  $version             = 'present',
  $absent              = false,
  $disable             = false,
  $disableboot         = false,
  $audit_only          = false,
  $noops               = false
  ) inherits standard::params {

  #################################################
  ### Definition of modules' internal variables ###
  #################################################

  # Variables defined in standard::params
  $package=$standard::params::package
  $service=$standard::params::service
  $config_file=$standard::params::config_file
  $config_dir=$standard::params::config_dir
  $config_file_mode=$standard::params::config_file_mode
  $config_file_owner=$standard::params::config_file_owner
  $config_file_group=$standard::params::config_file_group

  # Variables that apply parameters behaviours
  $manage_package = $standard::absent ? {
    true  => 'absent',
    false => $standard::version,
  }

  $manage_service_enable = $standard::disableboot ? {
    true    => false,
    default => $standard::disable ? {
      true    => false,
      default => $standard::absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $standard::disable ? {
    true    => 'stopped',
    default =>  $standard::absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $standard::service_autorestart ? {
    true    => Service[standard],
    false   => undef,
  }

  $manage_file = $standard::absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_audit = $standard::audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $standard::audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $standard::source ? {
    ''        => undef,
    default   => $standard::source,
  }

  $manage_file_content = $standard::template ? {
    ''        => undef,
    default   => template($standard::template),
  }


  #######################################
  ### Resourced managed by the module ###
  #######################################

  # Package
  package { $standard::package:
    ensure  => $standard::manage_package,
    noop    => $standard::noops,
  }

  # Service
  service { $standard::service:
    ensure     => $standard::manage_service_ensure,
    enable     => $standard::manage_service_enable,
    require    => Package[$standard::package],
    noop       => $standard::noops,
  }

  # Configuration File
  file { 'standard.conf':
    ensure  => $standard::manage_file,
    path    => $standard::config_file,
    mode    => $standard::config_file_mode,
    owner   => $standard::config_file_owner,
    group   => $standard::config_file_group,
    require => Package[$standard::package],
    notify  => $standard::manage_service_autorestart,
    source  => $standard::manage_file_source,
    content => $standard::manage_file_content,
    replace => $standard::manage_file_replace,
    audit   => $standard::manage_audit,
    noop    => $standard::noops,
  }

  # Configuration Directory
  if $standard::source_dir {
    file { 'standard.dir':
      ensure  => directory,
      path    => $standard::config_dir,
      require => Package[$standard::package],
      notify  => $standard::manage_service_autorestart,
      source  => $standard::source_dir,
      recurse => true,
      purge   => $standard::source_dir_purge,
      force   => $standard::source_dir_purge,
      replace => $standard::manage_file_replace,
      audit   => $standard::manage_audit,
      noop    => $standard::noops,
    }
  }


  #######################################
  ### Optionally include custom class ###
  #######################################
  if $standard::my_class {
    include $standard::my_class
  }

}

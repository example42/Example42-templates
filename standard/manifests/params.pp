# Class: standard::params
#
# This class defines default parameters used by the main module class standard
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to standard class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class standard::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'standard',
  }

  $service = $::operatingsystem ? {
    default => 'standard',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/standard',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/standard/standard.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

}

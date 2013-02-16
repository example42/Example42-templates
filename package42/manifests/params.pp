# Class: package42::params
#
# This class defines default parameters used by the main module class package42
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to package42 class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class package42::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'package42',
  }

  # General Settings
  $my_class = ''
  $version = 'present'
  $absent = false
  $noops = false

}

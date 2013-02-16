# Class: package42::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class package42::spec inherits package42 {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "package42": template => "package42/spec.erb" }

  File['package42.conf'] {
    content => template('package42/spec.erb'),
  }

}

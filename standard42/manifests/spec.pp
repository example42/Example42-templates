# Class: standard42::spec
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
class standard42::spec inherits standard42 {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "standard42": template => "standard42/spec.erb" }

  File['standard42.conf'] {
    content => template('standard42/spec.erb'),
  }

}

#
# Testing configuration file provisioning via source
# Auditing enabled
#
class { 'stdmod':
  source => 'puppet:///modules/stdlib/tests/test.conf',
  audit  => 'all',
}

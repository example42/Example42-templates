#
# Testing configuration file provisioning via template
# Auditing enabled
#
class { 'stdmod':
  template => 'stdlib/tests/test.conf',
  audit    => 'all',
}

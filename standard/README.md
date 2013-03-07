# Puppet module: standard

This is a Puppet module for standard.

Based on a template defined in http://github.com/Example42-templates/

Released under the terms of Apache 2 License.


## USAGE - Basic management

* Install standard with default settings

        class { 'standard': }

* Install a specific version of standard package

        class { 'standard':
          version => '1.0.1',
        }

* Disable standard service.

        class { 'standard':
          disable => true
        }

* Remove standard package

        class { 'standard':
          absent => true
        }

* Enable auditing without without making changes on existing standard configuration *files*

        class { 'standard':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'standard':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'standard':
          source => [ "puppet:///modules/example42/standard/standard.conf-${hostname}" , "puppet:///modules/example42/standard/standard.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'standard':
          source_dir       => 'puppet:///modules/example42/standard/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'standard':
          template => 'example42/standard/standard.conf.erb',
        }

* Automatically include a custom subclass

        class { 'standard':
          my_class => 'example42::my_standard',
        }


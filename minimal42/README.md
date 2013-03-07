# Puppet module: minimal42

This is a Puppet module for minimal42
It provides only package installation and file configuration.

Based on Example42 layouts by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-minimal42

Released under the terms of Apache 2 License.

This module requires the presence of Example42 Puppi module in your modulepath.


## USAGE - Basic management

* Install minimal42 with default settings

        class { 'minimal42': }

* Install a specific version of minimal42 package

        class { 'minimal42':
          version => '1.0.1',
        }

* Remove minimal42 resources

        class { 'minimal42':
          absent => true
        }

* Enable auditing without without making changes on existing minimal42 configuration *files*

        class { 'minimal42':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'minimal42':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'minimal42':
          source => [ "puppet:///modules/example42/minimal42/minimal42.conf-${hostname}" , "puppet:///modules/example42/minimal42/minimal42.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'minimal42':
          source_dir       => 'puppet:///modules/example42/minimal42/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'minimal42':
          template => 'example42/minimal42/minimal42.conf.erb',
        }

* Automatically include a custom subclass

        class { 'minimal42':
          my_class => 'example42::my_minimal42',
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/example42/puppet-minimal42.png?branch=master" alt="Build Status" />}[https://travis-ci.org/example42/puppet-minimal42]

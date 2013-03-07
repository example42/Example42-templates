# Puppet module: package42

This is a Puppet module for package42
It provides only package installation and management

Based on Example42 layouts by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-package42

Released under the terms of Apache 2 License.

This module requires the presence of Example42 Puppi module in your modulepath.


## USAGE - Basic management

* Install package42 with default settings

        class { 'package42': }

* Install a specific version of package42 package

        class { 'package42':
          version => '1.0.1',
        }

* Remove package42 resources

        class { 'package42':
          absent => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'package42':
          noops => true
        }

* Automatically include a custom subclass

        class { 'package42':
          my_class => 'example42::my_package42',
        }


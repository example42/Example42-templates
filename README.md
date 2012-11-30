Example42 Puppet Modules Templates

This is a collection of sample module layouts to be used as style reference or
starting template for the creation of new modules.

# What is (will be) here

   - The basic templates used for the creation of Example42 modules

   - Ideas for basic modules layouts without any Example42 dependency

   - Proposals of layouts for different kind of modules (applications, web applications, services...)

   - Ready to clone templates to be used by the Example42-tools/module_clone.sh script

   - Suggestions, proposals, alternatives,  git pull requests are **very** welcomed


# The Module dilemma

  - Everyone has his idea and style on how to make modules

  - Are my modules only for myself or also for others?

  - Modules from different sources have different interfaces (parameters)

  - For complex modules it makes sense to look around for the best or most fitting ones

  - For simple or new modules it makes sense to generate them consistently


# How to use the templates

  - Download the Example42-templates repo (and the required Example42-tools).
    They are both on Example42 modules set

        git clone --recursive git://github.com/example42/puppet-modules-nextgen.git

  - From the puppet-modules-nextgen base dir run the module_clone.sh script: 

        cd puppet-modules-nextgen
        Example42-tools/module_clone.sh -t standard42 -n mymodule

  - A brand new mymodule is created with all the features of the source template


# Example42 modules

  - Templates with the 42 suffix are based on Example42 Puppet Modules layout

  - The Main target of Example42 module is **extreme reusability**:
    You should be able to do whatever you need without changing the core module

  - Reusability at different levels:
  -- Multi OS support (main targets are Redhat and Ubuntu derivatives)
  -- Parameters to affect the module's behaviour
  -- Parameters to manage how configuration files and directoty are provided
  -- Parameters to add custom resurces or provide arbitrary options
  -- Freedom to choose the preferred data separation model (Hiera, TopScope vars, ENC)

  - Optional integration with Puppi and Example42's monitoring and firewalling features

  - Complete decommissiong support: you can remove (almost) whatever you've added

  - Documention, rspec tests and puppet-lint compliance

# Puppet Modules Templates Experiments

This repository contains various **experiments on Puppet modules design**.

Alternative solutions are researched and published to provide basic sample modules that can be used as **blueprint** for the (quick) generation of new basic modules of different nature, upon which the relevant customizations can be done.

A set of common parameters (and possibly community standard) greatly enhances modules usability and interoperability.
Some of the modules here (the ones named **stdmod**) implement an early proposal for a **Standard Module Interface**: a set of common and standard parameters that provide standard and predictable functionalities.

I personally think that something like this would be of great benefit for the Puppet Modules ecosystem.

All these modules feature some common principles:

- **True reusability**: you can completely manage the behaviour of the module via the parameters it exposes.

- Easy **Multi OS support** implementation: all internal references to paths and names are concentrated into a
  single params class.

- **Configuration freedom**: you can provide configuration files, parameters and whole dirs in the way you want.

- **Behaviour management**: you can define how the module's resources behave.

- **Decommissioning support**: All the resources can be installed and removed.


## MODULES TEMPLATES
The template modules in this repository:

- [stdmod](https://github.com/example42/puppet-stdmod) - An implementation of a **Standard Module Interface**, which uses PuppetLabs' stdlib. It manages the typical Package/Service/File pattern.

- [stdmodalt](https://github.com/example42/puppet-stdmodalt) - An alternative **Standard Module Interface** implementation with a layout based on separation of package/service/config resources into dedicated classes.

- [standard](https://github.com/example42/module-standard) - Another Package/Service/File pattern implementation, with different parameters and **no dependencies**.

- [standard42](https://github.com/example42/module-standard42) - The current **Example42** implementation of Package/Service/File module, with the Example42 additions for automatic monitoring, firewalling and puppi integration.

- [minimal42](https://github.com/example42/module-minimal42) - The current **Example42** implementation of Package/File only modules.

- [package42](https://github.com/example42/module-package42) - The current **Example42** implementation of a single Package module, without services or configurations.


## CLONE AND TEST
You can quickly create new modules from these templates.

First of all you need this repo with all its submodules:

    git clone --recursive https://github.com/example42/Example42-templates.git
  
Once you have the respository you can use the `clone.sh` script to generate a new module from an existing temmplate. 
For example, to create a basic openssh module from the **stdmod** template:

    ./clone -m stdmod -n openssh
    
A new openssh module directory is created and you can start to customize it:

- Edit `manifests/params.pp` to fix paths and names for different operating systems

- Change email address and author in `Modulefile` and `.travis.yml`

- Fix Travis icon url with your GitHub/Travis account in `README.md`

- Eventually add resources to manage in `manifests/init.pp` or in other subclasses

- Eventually add modules' parameters in `manifests/init.pp` and where used (note that the `options` parameter can be used to populate a custom template with any possibile configuration item, without the need to add it as module's parameter)

- Note that where you need to add other files managed by the module you can copy and paste the existing file resurce for the main configuration and change only the relevant parts (title, path, source or template…) keeping the other options to preserve the module's behaviour also on this new file (for example the `audit` or `noop` parameters)

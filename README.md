# Example42 Modules Templates Experiments

This repository contains various **experiments on Puppet modules design**.

Alternative solutions are researched an published to provide basic sample modules that can be used as **blueprint** for the (quick) generation of new basic modules of different nature, upon which the relevant customizations can be done.

A set of common parameters (and possibly community standard) greatly enhances modules usability and interoperability.
Some of the modules here (the ones named **stdmod**) implement an early proposal for a **Common Module Interface**: a set of common and standard parameters that provide standard functionalities.

I personally think that something like this would be of great benefit for the Puppet Modules ecosystem.

All these modules feature some common principles:

- **True reusability**: you can completely manage the behaviour of the module via the parameters it exposes.

- Easy **Multi OS support** implementation: all internal references to paths and names are concentraed into a
  single params class.

- **Configuration freedom**: you can provide configuration files, parameters and whole dirs in the way you want.

- **Behaviour management**: you can define how the module's resources behave.

- **Decommissioning support**: All the resources can be installed and removed.


The template modules in this repository:

- [stdmod](https://github.com/example42/module-stdmod) - An implementation of a **Common Module Interface**, which uses PuppetLabs' stdlib. It manages the typical Package/Service/File pattern.

- [stdmodalt](https://github.com/example42/module-stdmodalt) - An alternative **Common Module Interface** implementation with a layout based on separation of package/service/config resources.

- [standard](https://github.com/example42/module-standard) - Another Package/Service/File pattern implementation, with different parameters and **no dependencies**.

- [standard42](https://github.com/example42/module-standard42) - The current **Example42** implementation of Package/Service/File module, with the Example42 additions for automatic monitoring, firewalling and puppi integration.

- [minimal42](https://github.com/example42/module-minimal42) - The current **Example42** implementation of Package/File only modules.

- [package42](https://github.com/example42/module-package42) - The current **Example42** implementation of a single Package module, without services or configurations.




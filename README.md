# vagrant-fwdports

Vagrant's networking feature is great.
but sometimes we are confusing with auto-corrected ports.

vagrant-fwdports shows list of forwarded ports on Vagrant VM.

## Notice

vagrant-fwdports supports only VirtualBox provider. 

## Installation

Clone vagrant-fwdports into working directory:

    gem 'vagrant-fwdports'

Into vagrant-fwdports directory:

    cd vagrant-fwdports

And then execute:

    rake build

Finally install it:

    vagrant plugin install ./pkg/vagrant-fwdports-[version].gem

## Usage

    vagrant fwdports


On Single VM

```
+--------------------------------------+--------------+---------------------+------------+-----------+
| machine.id                           | machine.name | forwarded_port_name | guest_port | host_port |
+--------------------------------------+--------------+---------------------+------------+-----------+
| 7f4b1865-c6e9-45e7-8044-2c6a080440ee | default      | ssh                 | 22         | 2222      |
+--------------------------------------+--------------+---------------------+------------+-----------+
```

On Multi VM

```
+--------------------------------------+--------------+---------------------+------------+-----------+
| machine.id                           | machine.name | forwarded_port_name | guest_port | host_port |
+--------------------------------------+--------------+---------------------+------------+-----------+
| aa0d0f4c-80bd-44f3-80f4-b2a6febecc8f | web          | ssh                 | 22         | 2222      |
| c2ea05d3-f9ba-4b60-b8f9-6829b0c88123 | db           | ssh                 | 22         | 2200      |
+--------------------------------------+--------------+---------------------+------------+-----------+
```

## Synopsis

Puppet module to install rhnclient and point it at a spacewalk installation for software updates.

## Example

Defaults are stored in params.pp
This module sets up the spacewalk client repository and installs rhnsd to run by default once an hour. Disables osad.

## Motivation

Needed to tie existing hosts into a Spacewalk server for software updates and manage gpg encryption keys.

## Installation

Tested with CentOS 6.
Requires the spacewalk client repository (rhnclient will install it for you) https://fedorahosted.org/spacewalk/wiki/RegisteringClients 
Obviously requires a working spacewalk installation.
files/RHN-ORG-TRUSTED-SSL-CERT needs updated with the cert from your spacewalk installation.

Manages rpm signing keys. To install a new key for a repository do the following:
Download the key to any server that does not already have it installed.
rpm --import keyfile
mv keyfile `rpm -q gpg-pubkey | tail -1`
Copy the new keyfile (it will be named something like gpg-pubkey-longidstring) to rhnclient/files/public_keys/ on the puppetmaster
Add the new keyfile name to the $keyids array in /etc/puppet/environments/mansfield/modules/rhnclient/manifests/params.pp
Run puppet agent --test on your clients to get the new key

Included keys (for CentOS 6):

BareOS
BareOS Contrib
Base
EPEL
Extras
Foreman
Foreman Plugins
IUS
Maria 10
Mongo
Nginx
Percona
Percona Noarch
Puppet
Puppet Dependencies
Spacewalk
Spacewalk Client
Updates
Varnish
Webmin
Zabbix
Zabbix Non-Supported

## API Reference

serverurl     => url for the spacewalk server
activationkey => activation key to register to spacewalk with
interval      => rhnsd update interval
keyids        => gpg public key ids to install

## Contributors

Ryan Munz for Giftcards.com - May 2015

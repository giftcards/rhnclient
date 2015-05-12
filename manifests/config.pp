class rhnclient::config {
  require(rhnclient::packages)
  file {
    '/etc/sysconfig/rhn/up2date':
      ensure => present,
      notify => Service[$rhnclient::services],
      require  => Package[$rhnclient::packages];
    '/etc/sysconfig/rhn/systemid':
      ensure => present,
      notify => Service[$rhnclient::services],
      require  => Package[$rhnclient::packages];
    '/usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT':
      ensure => file,
      source => 'puppet:///modules/rhnclient/RHN-ORG-TRUSTED-SSL-CERT',
      notify => Exec['rhnreg_ks'];
    '/etc/yum/pluginconf.d/rhnplugin.conf':
      ensure => file,
      source => 'puppet:///modules/rhnclient/rhnplugin.conf';
  }

  augeas { 'rhnsd_interval':
    notify  => Service[$rhnclient::services],
    require => Package[$rhnclient::packages],
    changes => [
      "set /files/etc/sysconfig/rhn/rhnsd/INTERVAL ${rhnclient::interval}",
    ]
  }

  rhnclient::pubkey{$rhnclient::keyids: }

}

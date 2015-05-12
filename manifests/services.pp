class rhnclient::services {
  Service {
    ensure   => running,
    enable   => true,
    hasrestart => true,
    hasstatus  => true,
    require  => Package[$rhnclient::packages],
  }

  service { $rhnclient::services: }

  service { $rhnclient::noservices:
    ensure => stopped,
    enable => false,
  }

  exec {'rhnreg_ks':
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    refreshonly => true,
    require     => Package[$rhnclient::packages],
    command     => "rhnreg_ks --serverUrl=${rhnclient::serverurl} --activationkey=${rhnclient::activationkey} --force",
    notify      => Service[$rhnclient::services],
  }
}

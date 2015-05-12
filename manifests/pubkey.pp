define rhnclient::pubkey (
  $keyid = $name,
) {
  unless $keyid in $::rpm_pubkeys {
    file { "/etc/pki/rpm-gpg/${keyid}":
      ensure => file,
      source => "puppet:///modules/rhnclient/public_keys/${keyid}",
      notify => Exec["install-${keyid}"],
    }
  }

  exec { "install-${keyid}":
    command     => "rpm --import /etc/pki/rpm-gpg/${keyid}",
    path        => '/bin:/sbin:/usr/bin:/usr/sbin',
    refreshonly => true,
  }
}

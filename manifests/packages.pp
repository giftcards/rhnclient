class rhnclient::packages {
  unless defined(File['/etc/yum.repos.d/spacewalk-client.repo']) {
    file {'/etc/yum.repos.d/spacewalk-client.repo':
      source => 'puppet:///modules/rhnclient/spacewalk-client.repo',
    }
  }

  unless defined(Package['epel-release']) {
    package { 'epel-release':
      ensure => latest,
    }
  }

  package { $rhnclient::packages:
    ensure  => latest,
    require => [
      File['/etc/yum.repos.d/spacewalk-client.repo'],
      Package['epel-release'],
    ]
  }
}

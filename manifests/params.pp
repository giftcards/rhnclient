class rhnclient::params {
  $serverurl = 'https://spacewalk.example.org/XMLRPC'
  $activationkey = '1-testkey'
  $interval = '60'
  $keyids = [ 'gpg-pubkey-9cd4953f-4a9da118',
    'gpg-pubkey-00f97f56-467e318a',
    'gpg-pubkey-1bb943db-511147a9',
    'gpg-pubkey-863a853d-4f55f54d',
    'gpg-pubkey-0608b895-4bd22942',
    'gpg-pubkey-2d762e88-54609d77',
    'gpg-pubkey-11f63c51-3c7dc11d',
    'gpg-pubkey-79ea5ed4-508d25a6',
    'gpg-pubkey-cd2efd2a-4b26dda1',
    'gpg-pubkey-7bd9bf62-4e4e3262',
    'gpg-pubkey-c4deffeb-4c872f3a',
    'gpg-pubkey-e0f8efd4-5493deba',
    'gpg-pubkey-5a01e889-551d5fdc'
  ]
  $packages = ['rhn-client-tools',
    'rhn-check',
    'rhn-setup',
    'rhnsd',
    'm2crypto',
    'yum-rhn-plugin']
  $nopackages = ['osad']
  $services = ['rhnsd']
}

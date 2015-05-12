class rhnclient (
  $serverurl = $rhnclient::params::serverurl,
  $activationkey = $rhnclient::params::activationkey,
  $interval = $rhnclient::params::interval,
  $keyids = $rhnclient::params::keyids,
) inherits rhnclient::params {

  $packages = $rhnclient::params::packages
  $nopackages = $rhnclient::params::nopackages
  $services = $rhnclient::params::services
  $repotidy = $rhnclient::params::repotidy

  include rhnclient::packages
  include rhnclient::config
  include rhnclient::services

}

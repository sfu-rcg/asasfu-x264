# == Class: x264
#
# Module to allow yum install and dependency management of x264 
# while allowing you to pick repos to enable for the run.
#
# === Parameters
#
# [*ensure_version*]
#  Ensure parameter passed to Package resource to ensure specific version or other 
#   option such as latest
#   Default: latest
#
# === Examples
#
#  class { '::x264':
#    ensure_version => '2.1.5',
#  }
#
# === Authors
#
# Adam S <asa188@sfu.ca>
#
# === Copyright
#
# Copyright 2015 SFU, unless otherwise noted.
#
class x264 (
  $ensure_version = 'latest',
  $required_repos = $::x264::params::required_repos
) inherits ::x264::params {
  package { 'x264':
    ensure          => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
  }
}

# == Class x264::params
#
# This class is meant to be called from x264
# It sets variables according to platform.
#
class x264::params {
  case $::osfamily {
    'redhat': {
      case $::operatingsystem {
        CentOS: {
          case $::operatingsystemmajrelease {
            6: { $required_repos = 'atrpms,repoforge' }
            7: { $required_repos = 'atrpms,epel,repoforge,nux-dextop' }
            default: {
              $required_repos = ''
              fail("${::operatingsystem} version ${::operatingsystemmajrelease} not supported")
            }
          }
        }
        default: { 
          $required_repos = ''
          fail("${::operatingsystem} not supported")
        }
      }
    }
    default: { 
      $required_repos = ''
      fail("${::osfamily} not supported")
    }
  }
}

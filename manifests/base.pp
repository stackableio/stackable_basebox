node default {

  $source_hash = {
    puppetlabs => {
      'location'    => 'http://apt.puppetlabs.com',
      'release'     => 'precise',
      'repos'       => 'main dependencies',
      'key'         => '4BD6EC30',
      'include_src' => 'false',
    }
  }

  class {'stackable_base':
    apt_sources => $source_hash
  }

  $mailalias_hash = {
    root => {
      'recipient' => 'netops@stackable.io'
    }
  }
  
  class {'postfix':
    aliases => $mailalias_hash
  }

  class { 'ntp':
    ensure     => running,
    servers    => [ '0.ubuntu.pool.ntp.org iburst',
                    '1.ubuntu.pool.ntp.org iburst',
                    '2.ubuntu.pool.ntp.org iburst',
                    '3.ubuntu.pool.ntp.org iburst', ],
    autoupdate => true,
  }
}

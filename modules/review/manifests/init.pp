class review (
  $user = 'review',
){
  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  user { $user:
    ensure     => present,
    shell      =>  '/bin/bash',
    managehome => true,
    home       => $homedir,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/review/.bashrc',
  }

  service { 'puppet':
    ensure => running,
    enable => true,
  }
}

class system::hosts {
  resources { 'host':
    purge => true,
  }

host { 'jaime.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['jaime'],
  ip           => '172.31.18.230',
  target       => '/etc/hosts',
}
host { 'localhost':
  ensure       => 'present',
  host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
  ip           => '::1',
  target       => '/etc/hosts',
}
host { 'master.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['master', 'puppet'],
  ip           => '172.31.3.74',
  target       => '/etc/hosts',
}
host { 'training.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
}

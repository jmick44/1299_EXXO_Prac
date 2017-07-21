class ordering (
  $message = "my default message",
  $nginx_conf = undef,
) {

  # if $::kernel  == 'windows' {
  #   $nginx_conf = 'C:/programfiles/nginx',
  #}
  #elsif $::kernel == 'linux' {
  #  nginx_conf == '/etc/nginx',
  #}

  notify { "------------- MESSAGE is:  $message": }

  notify { "------------ NGINX_CONF is:  $nginx_conf": }

  package { 'nginx':
    ensure => installed,
    #before => File['nginx_conf'],
  }

  file { 'nginx_conf':
    path    => "${nginx_conf}/nginx.conf",
    ensure  => file,
    content => "${message}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    #notify => Service['nginx'],
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['nginx_conf'],
  }

}

class common::selinux_disable {
  file {'/etc/selinux/config':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  } ->
  file_line { 'selinux_disable':
    path  => '/etc/selinux/config',
    line  => 'SELINUX=disabled',
    match => '^SELINUX=\w+'
  }
}

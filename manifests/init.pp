class common {
  file {'/usr/local/etc':
    ensure => directory,
  }
  case $::operatingsystem {
    'Debian','Ubuntu': {
    }
    'CentOS','RedHat': {
      include common::selinux_disable
    }
  }
  include common::ncurses_utf_fix
  include rsyslog
  include tmux
  include common::packages
  include users::sudoers
  include mc_conf::default
}


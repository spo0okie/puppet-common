class common {
  include common::selinux_disable
  include rsyslog
  include puppet
  #include puppet::default_modules
  include common::packages
  include users::sudoers
  include ssh
  include tmux
#	include mysql_client
  include ntp_conf
  include mc_conf::default
}


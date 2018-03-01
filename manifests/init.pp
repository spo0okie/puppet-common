include stdlib

class selinux_disable {
	file {'/etc/selinux/config':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
	} ->
	file_line { "selinux_disable":
		path => '/etc/selinux/config',
		line => 'SELINUX=disabled',
		match => '^SELINUX=\w+'
	}
}

class common {
#	include selinux_disable
	include rsyslog
	include puppet
	include puppet::default_modules
	include common::packages
	include users::sudoers
#	include ssh
#	include tmux
#	include mysql_client
#	include ntp_conf
	include mc_conf::default
}


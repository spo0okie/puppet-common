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

class default_linux_packages {
	case $::operatingsystem {
		Debian: {
			package {
				'g++':				ensure => 'installed';
				'openssh-client':	ensure => 'installed';
				'ncurses-base':		ensure => 'installed';
				'ncurses-dev':		ensure => 'installed';
				'liblzo2-2':		ensure => 'installed';
				'liblzo2-dev':		ensure => 'installed';
				"linux-headers-$kernelrelease":ensure => 'installed';
				'libpcap-dev':		ensure => 'installed';
				'libpcap0.8':		ensure => 'installed';
				'libpcap0.8-dev':	ensure => 'installed';
			}
		}
		CentOS: {
			package {
				'gcc-c++':			ensure => 'installed';
				'openssh-clients':	ensure => 'installed';
				'ncurses':			ensure => 'installed';
				'ncurses-devel':	ensure => 'installed';
				'lzo':				ensure => 'installed';
				'lzo-devel':		ensure => 'installed';
				'kernel-devel':		ensure => 'installed';
				'libpcap-devel':	ensure => 'installed';
				'libpcap':			ensure => 'installed';
			}
		}
		OpenSuSE: {
			package {
				'gcc-c++':			ensure => 'installed';
				'openssh':			ensure => 'installed';
#				'ncurses':			ensure => 'installed';
				'ncurses-devel':	ensure => 'installed';
				'liblzo2-2':				ensure => 'installed';
				'lzo-devel':		ensure => 'installed';
				'kernel-devel':		ensure => 'installed';
				'libpcap-devel':	ensure => 'installed';
				'libpcap1':			ensure => 'installed';
			}
		}
	}
	package {
		'man':				ensure => 'installed';
		'gcc':				ensure => 'installed';
		'make':				ensure => 'installed';
		'automake':			ensure => 'installed';
		'unzip':			ensure => 'installed';
		'wget':				ensure => 'installed';
		'htop':				ensure => 'installed';
		'git':				ensure => 'installed';
		'subversion':		ensure => 'installed';
		'tcpdump':			ensure => 'installed';
		'libtool':			ensure => 'installed';
	}

}

class rsyslog_conf {
	service {'rsyslog':
		ensure => running,
		enable => true
	}
}

class def {
	include selinux_disable
	include puppet
	include puppet::default_modules
	include default_linux_packages
	include ssh
	include tmux
	include mysql_client
	include ntp_conf
	include mc_conf::default
	include rsyslog_conf
}


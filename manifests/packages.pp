class common::packages {
	case $::operatingsystem {
		'Debian','Ubuntu': {
			$custom = [
				'g++',
				'openssh-client',
				'ncurses-base',
				'ncurses-dev',
				'liblzo2-2',
				'liblzo2-dev',
				"linux-headers-$kernelrelease",
				'libpcap-dev',
				'libpcap0.8',
				'libpcap0.8-dev',
				'man',
				'make',
				'ssh'
			]
			$options = ['--allow-unauthenticated', '-f']
		}
		'CentOS': {
			$custom_cos = [
				'gcc-c++',
				'openssh-clients',
				'ncurses',
				'ncurses-devel',
				'lzo',
				'lzo-devel',
				'kernel-devel',
				'libpcap-devel',
				'libpcap',
				'make',
				'psmisc',
				'openssh',
			]
			case $::operatingsystemmajrelease {
				7: {
					$custom = [ $custom_cos,'man-db']
				}
				default: {
					$custom = [ $custom_cos, 'man']
				}
			}
			$options = []
		}
		'OpenSuSE': {
			$custom = [
				'gcc-c++',
				'openssh',
#				'ncurses',
				'ncurses-devel',
				'liblzo2-2',
				'lzo-devel',
				'kernel-devel',
				'libpcap-devel',
				'libpcap1',
				'man',
				'make',
			]
			$options = []
		}
		'FreeBSD': {
			$custom = [
				'sudo',
			]
			$options = []
		}
	}
	$default = [
		'bash',
		'gcc',
		'automake',
		'unzip',
		'wget',
		'htop',
		'git',
		'subversion',
		'tcpdump',
		'libtool',
	]
	
	$total=[ $default, $custom ]
	package { $total :
		ensure => present,
		install_options => $options,
	}

}


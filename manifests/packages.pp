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
		'CentOS','RedHat': {
			include repos::epel
			$custom_cos = [
				'gcc-c++',
				'openssh-clients',
				'ncurses',
				'ncurses-devel',
				'lzo',
				'lzo-devel',
				'kernel-devel',
				"kernel-devel-$kernelrelease",
				'libpcap',
				'make',
				'psmisc',
				'openssh',
				'redhat-lsb-core',
				'dpkg',
				'smartmontools',
				'openssl-devel', #для сборки сквида
				#'libecap-devel', #для сборки сквида
				'libxml2-devel'  #для сборки сквида
			]
			case $::operatingsystemmajrelease {
				'7': {
					$custom = ['libecap-devel',$custom_cos,'man-db']
				}
				'8': {
					$custom = ['elfutils-libelf-devel',$custom_cos,'man-db']
				}
				default: {
					$custom = [ $custom_cos, 'man-pages']
				}
			}
			$options = []
		}
	}
	$default = [
		'bash',
		'gcc',
		'automake',
		'autoconf',
		'unzip',
		'wget',
		'htop',
		'git',
		'subversion',
		'tcpdump',
		'libtool',
		'libtool-ltdl-devel',
	]
	$total=[ $default, $custom ]
	package { $total :
		ensure => present,
		install_options => $options,
	}

}


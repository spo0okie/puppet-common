#libtoolize - нужен для сборки сквида
class common::packages {
	case $::operatingsystem {
		'Debian','Ubuntu': {
			$kernel_devel="linux-headers-$kernelrelease"
			$libtoolize='libtool'
			$custom = [
				'g++',
				'openssh-client',
				'ncurses-base',
				'libncurses5-dev',
				'liblzo2-2',
				'liblzo2-dev',
				$kernel_devel,
				'libssl-dev',	#voipmonitor
				'libgcrypt20-dev',	#voipmonitor
				'libpcap-dev',
				'libpcap0.8',
				'libpcap0.8-dev',
				'libusb-dev',	#>asterisk::dahdi
				'man',
				'make',
				'ssh',
				'smartmontools',
				'libxml2-dev',  #>asterisk,squid
				'sudo',
				'psmisc',		#killall
			]
			$options = ['--allow-unauthenticated', '-f']
		}
		'CentOS','RedHat': {
			include repos::epel
			$kernel_devel="kernel-devel-$kernelrelease"
			$custom_cos = [
				'gcc-c++',
				'openssh-clients',
				'ncurses',
				'ncurses-devel',
				'lzo',
				'lzo-devel',
				'kernel-devel',
				$kernel_devel,
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
					$libtoolize='libtool-ltdl-devel'
					$custom = [$libtoolize, $custom_cos, 'man-pages']
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
		'curl',
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


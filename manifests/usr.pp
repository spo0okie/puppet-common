#типовые юзернеймы
class common::usr {
	case $::operatingsystem {
		'Debian','Ubuntu': {
			$nobody='nobody'
			$nogroup='nogroup'
		}
		'CentOS','RedHat': {
			$nobody='nobody'
			$nogroup='nobody'
		}
	}
}


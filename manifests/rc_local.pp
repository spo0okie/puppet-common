class common::rc_local {
  file { '/etc/systemd/system/rc-local.service':
    source => 'puppet:///modules/common/rc-local.service',
  }

  file { '/etc/rc.local':
    ensure  => 'present',
    replace => 'no', # this is the important property
    source  => 'puppet:///modules/common/rc.local',
    mode    => '0755',
  }
}

class common::ncurses_utf_fix {
    file_line { "ncurses_utf_fix_conf":
        path => "/etc/environment",
        line => "export NCURSES_NO_UTF8_ACS=1",
    }
}

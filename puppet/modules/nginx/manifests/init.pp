class nginx {
    package { "nginx":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    service { "nginx":
        ensure => running,
        enable => true,
        hasrestart => true,
        require => Package["nginx"],
    }
}

class bootstrap {
    exec { "apt-get update":
        command => "apt-get -y update",
        timeout => 0
    }

    $system_packages = ["build-essential"]
    package { $system_packages:
        ensure  => "installed",
        require => Exec["apt-get update"]
    }

    $dev_tools = ["git-core", "vim", "curl"]
    package { $dev_tools:
        ensure  => "installed",
        require => Exec["apt-get update"]
    }
}

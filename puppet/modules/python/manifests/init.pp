class python {
    $python_dev = ["python", "python-dev", "python-setuptools"]
    package { $python_dev:
        ensure => latest,
        require => Class["bootstrap"]
    }

    exec { "easy_install pip":
        command => "easy_install pip",
        require => Package["python-setuptools"]
    }

    package { 'virtualenv':
        ensure => installed,
        provider => pip,
        require => Exec["easy_install pip"]
    }

    package { 'virtualenvwrapper':
        ensure => installed,
        provider => pip,
        require => Exec["easy_install pip"]
    }
}

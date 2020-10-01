class mysql {
	package { ['mysql-server']:
		ensure => installed;
	}
	
	service { 'mysql':
		ensure => running,
		require => Package['mysql-server'];
	}
	
	exec { 'set-mysql-password':
                path => ['/bin', '/usr/bin'],
                command => "mysqladmin -u root password masterkey",
                require => Service['mysql'],
    }
}
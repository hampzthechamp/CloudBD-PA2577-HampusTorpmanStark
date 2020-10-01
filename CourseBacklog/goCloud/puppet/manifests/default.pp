node 'appserver.bo' {
	package { ['nodejs', 'npm']:
		ensure => installed,
	}
}

node 'dbserver.bo' {
		package { ['mysql-server']:
		ensure => installed;
	}
	
	service { 'mysql-server':
		ensure => running,
		require => Package['mysql-server'];
	}
	
	exec { 'set-mysql-password':
                path => ['/bin', '/usr/bin'],
                command => "mysqladmin -u root password masterkey",
                require => Service['mysql-server'],
    }
}

exec {'apt-get update':
		command => '/usr/bin/apt-get update';
	}
# == Class: sbt-ubuntu
#
# Installs Scala Build Tools

class sbt-ubuntu {
  exec { 'set-repo':
    command => 'echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list',
    path    => '/usr/bin/:/bin/',
    before  => Exec['update']
  }
  
  exec { 'update':
    command => 'sudo apt-get update',
    path    => '/usr/bin/:/bin/',
    before  => Exec['install-sbt']
  }
  
  exec { 'install-sbt':
    environment => ["DEBIAN_FRONTEND=noninteractive"],
    command     => 'sudo apt-get -y --force-yes install sbt',
    path        => '/usr/bin/:/bin/'
  }
}

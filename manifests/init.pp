# == Class: sbt
#
# Installs Scala Build Tools
#
# === Parameters
#

class sbt {
  exec {'download_sbt':
    command => '/usr/bin/curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo',
    creates => '/etc/yum.repos.d/bintray-sbt-rpm.repo'
  }

  package {'sbt':
    ensure  => present,
    source  => '/etc/yum.repos.d/bintray-sbt-rpm.repo',
    require => Exec['download_sbt']
  }
}

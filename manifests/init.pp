class tomcat7 (
  $tomcat_user = '',
  $java_opts = '-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC',
  $lang = 'en_US') {

  include tomcat7::params

  Package[$tomcat7::params::jdk] -> Package['tomcat7'] -> File[$tomcat7::params::tomcat_settings] ~> Service['tomcat7']

  if $tomcat_user == '' {
    $tomcat_user_internal = $tomcat7::params::tomcat_user
  } else {
    $tomcat_user_internal = $tomcat_user
  }

  case $::osfamily {
    'RedHat' : {
      require jpackage
    }
  }

  package {$tomcat7::params::jdk:
    ensure => installed,
  }

  package {'tomcat7' :
    ensure => installed,
  }

  file {$tomcat7::params::tomcat_settings :
    ensure  => present,
    content => template('tomcat7/tomcat7.erb'),
  }

  service {'tomcat7' :
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}

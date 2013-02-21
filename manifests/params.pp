class tomcat7::params {

  case $::osfamily {
    'RedHat' : {
      $tomcat_user = 'tomcat'
      $tomcat_settings = '/etc/sysconfig/tomcat7'
    }
    'Debian' : {
      $tomcat_user = 'tomcat7'
      $tomcat_settings = '/etc/default/tomcat7'
    }
    default : {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat Debian")
    }
  }
}

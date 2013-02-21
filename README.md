# puppet-tomcat7 [![Build Status](https://travis-ci.org/Spredzy/puppet-tomcat7.png)](https://travis-ci.org/Spredzy/puppet-tomcat7)


A puppet module that installs the Tomcat Java Servlet Container

# About

This module installs Tomcat 7 from your package system.

On Entreprise Linux based system, packages are retrieved from JPackage repositories.

# Usage

Simplest form

    inlcude tomcat7

If you have parameters you wan to specify

    class {'tomcat7':
      java_opts => '-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC',
      lang => 'fr_FR',
      tomcat_user => my_tomcat_user',
    }

# Tests

It has been tested on

* CentOS 6.3
* Debian 6

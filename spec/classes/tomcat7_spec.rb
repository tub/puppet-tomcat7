# spec/classes/tomcat7_spec.rb

require 'spec_helper'

describe 'tomcat7' do


  context 'when Debian' do

    let(:params) do
      {:tomcat_user => 'tomcat7',
       :lang        => 'fr_FR',
       :java_opts   => '-Xms128m'}
    end

    let(:facts) do
      {:osfamily => 'Debian',
       :operatingsystem => 'Debian'}
    end

    it 'does not install jpackage' do
      should_not include_class('jpackage')
    end

    it 'contains debian testing repos' do
      should contain_class('apt')
    end

    it 'install tomcat7' do
      should contain_package('tomcat7').with({'ensure' => 'installed'})
    end

    it 'configure tomcat7 accordingly (/etc/default/tomcat7)' do
      should contain_file('/etc/default/tomcat7')\
        .with_content(/^TOMCAT7_USER=tomcat7$/)\
        .with_content(/^JAVA_OPTS="-Xms128m"$/)\
        .with_content(/^LANG="fr_FR"$/)
    end

    it 'configure the tomcat7 service accordingly' do
      should contain_service('tomcat7').with({
        'ensure' => 'running',
        'hasrestart' => 'true',
        'hasstatus' => 'true',
        'enable' => 'true',
      })
    end

  end

  context 'when CenOS' do

    let(:params) do
      {:tomcat_user => 'tomcat7',
       :lang        => 'fr_FR',
       :java_opts   => '-Xms128m'}
    end

    let(:facts) do
      {:osfamily => 'RedHat',
       :operatingsystem => 'CentOS'}
    end

    it 'install jpackage' do
      should include_class('jpackage')
    end

    it 'install tomcat7' do
      should contain_package('tomcat7').with({'ensure' => 'installed'})
    end

    it 'configure tomcat7 accordingly (/etc/sysconfig/tomcat7)' do
      should contain_file('/etc/sysconfig/tomcat7')\
        .with_content(/^TOMCAT7_USER=tomcat7$/)\
        .with_content(/^JAVA_OPTS="-Xms128m"$/)\
        .with_content(/^LANG="fr_FR"$/)
    end

    it 'configure the tomcat7 service accordingly' do
      should contain_service('tomcat7').with({
        'ensure' => 'running',
        'hasrestart' => 'true',
        'hasstatus' => 'true',
        'enable' => 'true',
      })
    end

  end

end

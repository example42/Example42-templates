require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'stdmod' do

  let(:title) { 'stdmod' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test stdmod installation' do
    it { should contain_package('stdmod').with_ensure('present') }
    it { should contain_service('stdmod').with_ensure('running') }
    it { should contain_service('stdmod').with_enable('true') }
    it { should contain_file('stdmod.conf').with_ensure('present') }
  end

  describe 'Test installation of a specific version' do
    let(:params) { {:version => '1.0.42' } }
    it { should contain_package('stdmod').with_ensure('1.0.42') }
  end

  describe 'Test decommissioning - absent' do
    let(:params) { {:ensure => 'absent'} }
    it 'should remove Package[stdmod]' do should contain_package('stdmod').with_ensure('absent') end
    it 'should stop Service[stdmod]' do should contain_service('stdmod').with_ensure('stopped') end
    it 'should not enable at boot Service[stdmod]' do should contain_service('stdmod').with_enable('false') end
    it 'should remove stdmod configuration file' do should contain_file('stdmod.conf').with_ensure('absent') end
  end

  describe 'Test status disabled' do
    let(:params) { {:status => 'disabled'} }
    it { should contain_package('stdmod').with_ensure('present') }
    it 'should stop Service[stdmod]' do should contain_service('stdmod').with_ensure('stopped') end
    it 'should not enable at boot Service[stdmod]' do should contain_service('stdmod').with_enable('false') end
    it { should contain_file('stdmod.conf').with_ensure('present') }
  end

  describe 'Test status unmanaged' do
    let(:params) { {:status => 'unmanaged'} }
    it { should contain_package('stdmod').with_ensure('present') }
    it { should_not contain_service('stdmod').with_ensure('present') }
    it { should_not contain_service('stdmod').with_ensure('absent') }
    it 'should not enable at boot Service[stdmod]' do should contain_service('stdmod').with_enable('false') end
    it { should contain_file('stdmod.conf').with_ensure('present') }
  end

  describe 'Test noops mode' do
    let(:params) { {:noops => true} }
    it { should contain_package('stdmod').with_noop('true') }
    it { should contain_service('stdmod').with_noop('true') }
    it { should contain_file('stdmod.conf').with_noop('true') }
  end

  describe 'Test customizations - template' do
    let(:params) { {:template => "stdmod/spec.erb" , :options => { 'opt_a' => 'value_a' } } }
    it 'should generate a valid template' do
      content = catalogue.resource('file', 'stdmod.conf').send(:parameters)[:content]
      content.should match "fqdn: rspec.example42.com"
    end
    it 'should generate a template that uses custom options' do
      content = catalogue.resource('file', 'stdmod.conf').send(:parameters)[:content]
      content.should match "value_a"
    end
  end

  describe 'Test customizations - source' do
    let(:params) { {:source => "puppet:///modules/stdmod/spec"} }
    it { should contain_file('stdmod.conf').with_source('puppet:///modules/stdmod/spec') }
  end

  describe 'Test customizations - source_dir' do
    let(:params) { {:source_dir => "puppet:///modules/stdmod/dir/spec" , :source_dir_purge => true } }
    it { should contain_file('stdmod.dir').with_source('puppet:///modules/stdmod/dir/spec') }
    it { should contain_file('stdmod.dir').with_purge('true') }
    it { should contain_file('stdmod.dir').with_force('true') }
  end

  describe 'Test customizations - custom class' do
    let(:params) { {:my_class => "stdmod::spec" } }
    it { should contain_file('stdmod.conf').with_content(/rspec.example42.com/) }
  end

  describe 'Test service autorestart' do
    let(:params) { {:autorestart => false } }
    it 'should not automatically restart the service, when autorestart => false' do
      content = catalogue.resource('file', 'stdmod.conf').send(:parameters)[:notify]
      content.should be_nil
    end
  end

end

require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'standard' do

  let(:title) { 'standard' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_package('standard').with_ensure('present') }
    it { should contain_service('standard').with_ensure('running') }
    it { should contain_service('standard').with_enable('true') }
    it { should contain_file('standard.conf').with_ensure('present') }
  end

  describe 'Test installation of a specific version' do
    let(:params) { {:version => '1.0.42' } }
    it { should contain_package('standard').with_ensure('1.0.42') }
  end

  describe 'Test decommissioning - absent' do
    let(:params) { {:absent => true} }
    it 'should remove Package[standard]' do should contain_package('standard').with_ensure('absent') end
    it 'should stop Service[standard]' do should contain_service('standard').with_ensure('stopped') end
    it 'should not enable at boot Service[standard]' do should contain_service('standard').with_enable('false') end
    it 'should remove standard configuration file' do should contain_file('standard.conf').with_ensure('absent') end
  end

  describe 'Test decommissioning - disable' do
    let(:params) { {:disable => true} }
    it { should contain_package('standard').with_ensure('present') }
    it 'should stop Service[standard]' do should contain_service('standard').with_ensure('stopped') end
    it 'should not enable at boot Service[standard]' do should contain_service('standard').with_enable('false') end
    it { should contain_file('standard.conf').with_ensure('present') }
  end

  describe 'Test decommissioning - disableboot' do
    let(:params) { {:disableboot => true} }
    it { should contain_package('standard').with_ensure('present') }
    it { should_not contain_service('standard').with_ensure('present') }
    it { should_not contain_service('standard').with_ensure('absent') }
    it 'should not enable at boot Service[standard]' do should contain_service('standard').with_enable('false') end
    it { should contain_file('standard.conf').with_ensure('present') }
  end

  describe 'Test noops mode' do
    let(:params) { {:noops => true} }
    it { should contain_package('standard').with_noop('true') }
    it { should contain_service('standard').with_noop('true') }
    it { should contain_file('standard.conf').with_noop('true') }
  end

  describe 'Test customizations - template' do
    let(:params) { {:template => "standard/spec.erb" , :options => { 'opt_a' => 'value_a' } } }
    it 'should generate a valid template' do
      content = catalogue.resource('file', 'standard.conf').send(:parameters)[:content]
      content.should match "fqdn: rspec.example42.com"
    end
    it 'should generate a template that uses custom options' do
      content = catalogue.resource('file', 'standard.conf').send(:parameters)[:content]
      content.should match "value_a"
    end
  end

  describe 'Test customizations - source' do
    let(:params) { {:source => "puppet:///modules/standard/spec"} }
    it { should contain_file('standard.conf').with_source('puppet:///modules/standard/spec') }
  end

  describe 'Test customizations - source_dir' do
    let(:params) { {:source_dir => "puppet:///modules/standard/dir/spec" , :source_dir_purge => true } }
    it { should contain_file('standard.dir').with_source('puppet:///modules/standard/dir/spec') }
    it { should contain_file('standard.dir').with_purge('true') }
    it { should contain_file('standard.dir').with_force('true') }
  end

  describe 'Test customizations - custom class' do
    let(:params) { {:my_class => "standard::spec" } }
    it { should contain_file('standard.conf').with_content(/rspec.example42.com/) }
  end

  describe 'Test service autorestart' do
    let(:params) { {:service_autorestart => false } }
    it 'should not automatically restart the service, when service_autorestart => false' do
      content = catalogue.resource('file', 'standard.conf').send(:parameters)[:notify]
      content.should be_nil
    end
  end

end

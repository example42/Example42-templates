require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'minimal42' do

  let(:title) { 'minimal42' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_package('minimal42').with_ensure('present') }
    it { should contain_file('minimal42.conf').with_ensure('present') }
  end

  describe 'Test installation of a specific version' do
    let(:params) { {:version => '1.0.42' } }
    it { should contain_package('minimal42').with_ensure('1.0.42') }
  end

  describe 'Test decommissioning - absent' do
    let(:params) { {:absent => true } }

    it 'should remove Package[minimal42]' do should contain_package('minimal42').with_ensure('absent') end 
    it 'should remove minimal42 configuration file' do should contain_file('minimal42.conf').with_ensure('absent') end
  end

  describe 'Test customizations - template' do
    let(:params) { {:template => "minimal42/spec.erb" , :options => { 'opt_a' => 'value_a' } } }

    it 'should generate a valid template' do
      content = catalogue.resource('file', 'minimal42.conf').send(:parameters)[:content]
      content.should match "fqdn: rspec.example42.com"
    end
    it 'should generate a template that uses custom options' do
      content = catalogue.resource('file', 'minimal42.conf').send(:parameters)[:content]
      content.should match "value_a"
    end

  end

  describe 'Test customizations - source' do
    let(:params) { {:source => "puppet://modules/minimal42/spec" , :source_dir => "puppet://modules/minimal42/dir/spec" , :source_dir_purge => true } }

    it 'should request a valid source ' do
      content = catalogue.resource('file', 'minimal42.conf').send(:parameters)[:source]
      content.should == "puppet://modules/minimal42/spec"
    end
    it 'should request a valid source dir' do
      content = catalogue.resource('file', 'minimal42.dir').send(:parameters)[:source]
      content.should == "puppet://modules/minimal42/dir/spec"
    end
    it 'should purge source dir if source_dir_purge is true' do
      content = catalogue.resource('file', 'minimal42.dir').send(:parameters)[:purge]
      content.should == true
    end
  end

  describe 'Test customizations - custom class' do
    let(:params) { {:my_class => "minimal42::spec" } }
    it 'should automatically include a custom class' do
      content = catalogue.resource('file', 'minimal42.conf').send(:parameters)[:content]
      content.should match "fqdn: rspec.example42.com"
    end
  end

end

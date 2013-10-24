Pod::Spec.new do |s|

  s.name         = "MSSpec"
  s.version      = "0.0.1"
  s.summary      = "Kiwi Spec with support to inject mocks using Objection"
  s.description  = <<-DESC
Kiwi Spec with support to inject mocks using Objection.

A series of macros also make using Objection much easier:

- ```MSInjectionRequireProperties```
- ```MSInjectionDesignatedInitializer```,
- ```MSInjectionCreateObject```,
- ```MSInjectionInjectDependencies```
                   DESC
  s.homepage     = "https://github.com/mindsnacks/MSSpec"
  s.license      = { :type => 'BSD', :file => 'LICENSE' }
  s.author       = { "NachoSoto" => "hello@nachosoto.com" }
  s.default_subspec = 'App'  

  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.7'

  s.source       = { :git => "https://github.com/mindsnacks/MSSpec.git", :tag => s.version.to_s }

  s.dependency 'Objection', '~> 1.2'
  s.dependency 'libextobjc', '~> 0.3'

  s.subspec 'App' do |s|
	  s.source_files  = 'MSSpec/Classes/App/*.{h,m}'
	  s.public_header_files = 'MSSpec/Classes/MSInjection.h'
  end

  s.subspec 'Tests' do |s|
    s.dependency 'Kiwi/XCTest', '~> 2.x'	 
    s.dependency 'MSSpec/App'

	s.framework = 'XCTest'
	
	s.source_files = 'MSSpec/Classes/Tests/*.{h,m}'
	s.public_header_files = 'MSSpec/Classes/Tests/MSSpec.h'

	s.prefix_header_contents = <<-EOS
#import <XCTest/XCTest.h>
#import <MSSpec/MSSpec.h>
EOS
  end
end
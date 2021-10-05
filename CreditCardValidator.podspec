Pod::Spec.new do |s|

	s.name = "CreditCardValidator"
	s.version = "0.5.2"
	s.summary = "Credit Card Validator in Swift"
	s.homepage = "https://github.com/vitkuzmenko/CreditCardValidator"
	s.license = { :type => "MIT", :file => "LICENSE" }
	s.author = { "Vitaliy" => "kuzmenko.v.u@gmail.com" }
	
	s.ios.deployment_target = '9.0'
	s.osx.deployment_target = '10.9'
	
	s.source = { :git => "https://github.com/vitkuzmenko/CreditCardValidator.git", :tag => s.version.to_s }
	s.source_files = "Sources/CreditCardValidator/*.swift"
	
	s.swift_versions = ['5.1', '5.2', '5.3']

end

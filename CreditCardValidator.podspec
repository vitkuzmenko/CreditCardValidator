Pod::Spec.new do |s|

  s.name         = "CreditCardValidator"
  s.version      = "0.4"
  s.summary      = "Credit Card Validator in Swift"

  s.homepage     = "https://github.com/vitkuzmenko/CreditCardValidator"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Vitaliy" => "kuzmenko.v.u@gmail.com" }
  s.social_media_url   = "http://twitter.com/vitkuzmenko"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source       = { :git => "https://github.com/vitkuzmenko/CreditCardValidator.git", :tag => s.version.to_s }

  s.source_files  = "CreditCardValidator/*.swift"
  
  s.requires_arc = 'true'

end

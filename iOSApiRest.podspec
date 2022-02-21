Pod::Spec.new do |spec|

  spec.name         = "iOSApiRest"
  spec.version      = "1.0.3"
  spec.summary      = "Framework for api rest movies"
  spec.homepage     = "https://github.com/xKhrizZ/iOSApiRest"
  spec.license      = "MIT"
  spec.author       = { "Christian R" => "christianapu@hotmail.com" }
  spec.platform     = :ios, "12.0"
  spec.ios.deployment_target = '12.0'
  spec.source       = { :git => "https://github.com/xKhrizZ/iOSApiRest.git", :tag => spec.version.to_s }
  spec.source_files  = "iOSApiRest/**/*.{swift}"

end

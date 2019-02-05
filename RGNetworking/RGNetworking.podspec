Pod::Spec.new do |s|
  s.name         = 'RGNetworking'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.homepage     = "https://github.com/eljec/iOS-accelerator-2019"
  s.author       = { 'Related Code' => 'romanguarino@gmail.com' }
  s.summary      = "A short description of MeliDevSDK"
  s.source       = { :git => "https://github.com/eljec/iOS-accelerator-2019.git", :tag => "0.0.1" }
  s.platform     = :ios
  s.source_files = 'RGNetworking/RGNetworking/RGNetworking.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target  = '9.3'
end

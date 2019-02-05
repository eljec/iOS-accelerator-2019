Pod::Spec.new do |s|
 s.name         = 'MELINetworking'
 s.version      = '0.0.1'
 s.license      = 'ATR'
 s.homepage     = 'http://relatedcode.com'
 s.author       = { 'ATR Code' => 'info@atr.com' }
 s.summary      = 'This library manage HTTP request for a 3 party app'
 s.source       = { :git => "https://github.com/relatedcode/ProgressHUD.git", :tag => 'v2.60' }
 s.platform     = :ios
 s.source_files = 'pod-networking/MELINetworking.{h,m}'
 s.requires_arc = true
 s.ios.deployment_target  = '9.3'
end
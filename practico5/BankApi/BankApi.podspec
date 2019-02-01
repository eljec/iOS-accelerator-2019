Pod::Spec.new do |s|
  s.name         = 'BankApi'
  s.version      = '0.0.1'
  s.license      = 'ATR'
  s.homepage     = 'http://relatedcode.com'
  s.author       = { 'ATR Code' => 'info@atr.com' }
  s.summary      = 'This library manage HTTP request for a 3 party app'
  s.source       = { :git => "https://github.com/relatedcode/BankApi.git", :tag => 'v2.60' }
  s.platform     = :ios
  s.source_files = 'BankApi/*.{swift,h,m}'
  s.ios.source_files = 'BankApi/*.h'
  s.osx.source_files = 'BankApi/*.h'
end
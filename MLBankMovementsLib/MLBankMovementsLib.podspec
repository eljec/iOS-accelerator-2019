Pod::Spec.new do |s|
  s.name         = 'MLBankMovementsLib'
  s.version      = '0.0.1'
  s.homepage     = 'https://mercadolibre.com.ar'
  s.license      = 'ATR'
  s.author       = { 'Atr Code' => 'info@atr.com' }
  s.summary      = 'NetworkPod is a lightweight and easy-to-use network for iOS.'
  s.source       = { :git => 'https://github.com/tonymillion/Reachability.git', :tag => 'v3.1.0' }
  s.platform     = :ios
  s.source_files = 'MLBankMovementsLib/MLBankMovements.{swift, h, m}'
  s.ios.source_files = 'MLBankMovementsLib/*.h'
  s.osx.source_files = 'MLBankMovementsLib/*.h'
  s.requires_arc = true
  s.ios.deployment_target  = '9.3'
end 

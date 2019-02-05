
Pod::Spec.new do |s|


  s.name         = "CuentaBancariaLib"
  s.version      = "0.0.1"
  s.summary      = "A short description of CuentaBancariaLib."
  s.description  = "Esto es una descripción"

  s.homepage     = "https://github.com/gquarin?tab=repositories"
  s.license      = "none"
  s.author             = { "Gonzalo" => "quaringonzalo@gmail.com" }
  s.source       = { :git => "https://github.com/gquarin?tab=repositories" }
  s.source_files  = "cuenta-bancaria-lib/Shared/*.swift"
  s.platform         = :ios, "8.0"


end

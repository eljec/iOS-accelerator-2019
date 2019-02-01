Pod::Spec.new do |s|

 s.name         = "RGBankAccountLib"
 s.version      = "0.0.1"
 s.summary      = "A short description of CuentaBancariaLib."
 s.description  = "Esto es una descripción"

 s.homepage     = "https://github.com/romangua?tab=repositories"
 s.license      = "none"
 s.author             = { "Roman Guarino" => "romanguarino@gmail.com" }
 s.source       = { :git => "https://github.com/romangua?tab=repositories" }
 s.source_files  = "RGBankAccountLib/RGBankAccount.swift", "RGBankAccountLib/RGAccount.swift", "RGBankAccountLib/RGMovement.swift"
 s.platform         = :ios, "8.0"

end
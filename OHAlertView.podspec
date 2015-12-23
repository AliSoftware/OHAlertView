Pod::Spec.new do |s|
    s.name         = "OHAlertView"
    s.version      = "3.0.1"
    s.summary      = "AlertView helper with blocks and a simple to use API. Uses UIAlertController in iOS 8+, UIAlertView otherwise."
    s.description  = <<-DESC
        AlertView helper that uses blocks to handle its callback.

         * If your deployment target is eariler than iOS 8, this will use UIAlertView
         * If your deployment target is iOS 8 or above, this will use the new UIAlertController
    DESC

    s.homepage     = "https://github.com/AliSoftware/OHAlertView"
    s.license      = "MIT"
    s.authors      = { 'Olivier Halligon' => 'olivier.halligon+ae@gmail.com' }

    s.source       = { :git => "https://github.com/AliSoftware/OHAlertView.git", :tag => s.version.to_s }
    s.source_files = "OHAlertView/*.{m,h}"
    s.public_header_files = "OHAlertView/*.h"

    s.frameworks = 'Foundation', 'UIKit'
    s.requires_arc = true
    s.ios.deployment_target = '5.0'
end

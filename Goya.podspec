Pod::Spec.new do |spec|

  spec.name         = "Goya"
  spec.version      = "1.0.0"
  spec.summary      = "An easy way to set styles to any UIResponder from the Interface Builder written in Swift"
  spec.description  = <<-DESC
  Customize the appearance and any other property of any UIResponder (views, view controllers, labels, buttons)
                       just by setting a style string in the Interface Builder.
                   DESC
  spec.homepage     = "https://github.com/ManueGE/Goya/"
  spec.license      = "MIT"


  spec.author    = "Manuel García-Estañ"
  spec.social_media_url   = "http://twitter.com/ManueGE"

  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/ManueGE/Goya.git", :tag => "#{spec.version}" }

  spec.requires_arc = true
  spec.framework = "UIKit"
  spec.source_files  = "alamofire_activity_logger/Request+ActivityLogger.swift"

  # Subspecs
  spec.default_subspec = 'Inspectable'

  spec.subspec 'Lite' do |lite|
    lite.source_files = "goya/goya/lite/*.{swift}"
  end

  spec.subspec 'Inspectable' do |inspectable|
    inspectable.dependency "Goya/Lite"
    inspectable.source_files = "goya/goya/inspectable/*.{swift}"
  end
end

Pod::Spec.new do |s|
  s.name         = "PaddedView"
  s.version      = "1.0.1"
  s.summary      = "Easily add padding to your UILabels, UIImageViews, and custom UIViews."

  s.description  = "PaddedView is a UIView subclass that sets its layoutMargins to UIEdgeInsetsZero if its content's height or width is zero. This makes it easy to create views that need to show padding, but which need the padding to disappear when their content is nil."

  s.homepage     = "https://github.com/project-a/paddedview"
  s.screenshots  = "https://raw.githubusercontent.com/project-a/paddedview/master/Screenshots/iOS-screenshot-1.png", "https://raw.githubusercontent.com/project-a/paddedview/master/Screenshots/iOS-screenshot-2.png" 


  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.authors            = { "Ariel Elkin" => "ariel.elkin@project-a.com", "Project A Ventures" => "info@project-a.com" }
  s.social_media_url   = "https://twitter.com/ProjectAcom"
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/project-a/paddedview.git", :tag => s.version}
  s.source_files = "PaddedView.swift"
end

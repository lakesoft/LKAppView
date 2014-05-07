Pod::Spec.new do |s|
  s.name         = "LKAppView"
  s.version      = "1.0.0"
  s.summary      = "App List Library"
  s.description  = <<-DESC
App List Library.
                   DESC
  s.homepage     = "https://github.com/lakesoft/LKAppView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroshi Hashiguchi" => "xcatsan@mac.com" }
  s.source       = { :git => "https://github.com/lakesoft/LKAppView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'
  s.resources    = 'Resources/*'

end

Pod::Spec.new do |s|
  s.name         = "Needs"
  s.version      = "0.1.0"
  s.summary      = "Property Wrapper for setNeeds- methods"
  s.description  = <<-DESC
    Automatically calls one or several setNeeds- methods when updating a property
  DESC
  s.homepage     = "https://github.com/jegnux/Needs"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jérôme Alves" => "j.alves@me.com" }
  s.social_media_url   = ""
  s.swift_version = "5.2"
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/jegnux/Needs.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end

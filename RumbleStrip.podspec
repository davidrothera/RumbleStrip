#
# Be sure to run `pod lib lint RumbleStrip.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RumbleStrip"
  s.version          = "0.1.0"
  s.summary          = "A simple feedback library for iOS apps."
  s.description      = <<-DESC
                       # RumbleStrip

                       A simple feedback library for iOS apps.
                       DESC
  s.homepage         = "https://github.com/davidrothera/RumbleStrip"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "David Rothera" => "david.rothera@gmail.com" }
  s.source           = { :git => "https://github.com/davidrothera/RumbleStrip.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/davidrothera'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RumbleStrip' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'AudioToolbox', 'MessageUI'
  # s.dependency 'AFNetworking', '~> 2.3'
end

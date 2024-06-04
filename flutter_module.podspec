#
# Be sure to run `pod lib lint flutter_module.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'flutter_module'
  s.version          = '0.1.0'
  s.summary          = 'A short description of flutter_module.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/david/flutter_module'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'david' => 'davidwang@wondercore.com' }
  s.source           = { :git => 'https://github.com/david/flutter_module.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'flutter_module/Classes/**/*'

  s.resources = ['flutter_module/Classes/flutter_module/.ios/**/*', 'flutter_module/Classes/flutter_module/.android/**/*' , 'flutter_module/Classes/flutter_module/.dart_tool/**/*']
  
  # s.resource_bundles = {
  #   'flutter_module' => ['flutter_module/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

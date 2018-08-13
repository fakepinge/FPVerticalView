#
# Be sure to run `pod lib lint FPVerticalView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FPVerticalView'
  s.version          = '1.0.4'
  s.summary          = 'A container for the vertical layout subviews.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: A container for the vertical layout subviews, The vertical layout of multiple sub-views，It is not concerned with their specific location.
                       DESC

  s.homepage         = 'https://github.com/fakepinge/FPVerticalView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fakepinge@gmail.com' => 'fakepinge@gmail.com' }
  s.source           = { :git => 'https://github.com/fakepinge/FPVerticalView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FPVerticalView/Classes/**/*'

  # s.resource_bundles = {
  #   'FPVerticalView' => ['FPVerticalView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.dependency 'Masonry'

end

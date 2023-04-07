source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/CirrusMD/podspecs.git'

platform :ios, '13.0'

use_frameworks!

workspace 'CirrusMDSDK-Example.xcworkspace'

target 'CirrusMDSDK-Pods' do
  project 'CirrusMDSDK-Example.xcodeproj'
  pod 'CirrusMDSDK', '~> 10.4.0'
end

target 'CirrusMDSDK-Pods-ObjC' do
  project 'CirrusMDSDK-Example.xcodeproj'
  pod 'CirrusMDSDK', '~> 10.4.0'
end

# On an M1 or M2 Mac, uncomment these lines to build to simulator

#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
#    end
#  end
#end

# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
use_frameworks!

def shared_pods
  pod 'Bond', '~> 6.1.1'
  pod 'SwiftyJSON'
  pod 'Reachability'
  pod 'EZSwiftExtensions'
  pod 'SwiftKeychainWrapper'
  pod 'SnapKit'
end

def test_pods
  pod 'Nimble'
  pod 'Mockingjay'
end

target 'Example' do
  shared_pods
  pod 'Alamofire'
  pod 'ReactiveKit'
  pod 'Cheetah'
  pod 'FontAwesome.swift'
  pod 'PKHUD'
  pod 'CWStatusBarNotification'
  pod 'AlamofireReactive'
  pod 'AlamofireImage'
end

target 'ExampleTests' do
  shared_pods
  test_pods
  pod 'Quick'
end

target 'ExampleUITests' do
  shared_pods
  test_pods
  pod 'KIF'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

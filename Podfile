# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ASCEND' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ASCEND

  pod 'Firebase/Analytics'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Performance'
  pod 'Firebase/Core'
  pod 'IQKeyboardManagerSwift'
  pod 'SwiftLint'
  pod 'lottie-ios'
  pod 'Alamofire','~> 4.9.0'
  pod 'SDWebImage', '~> 5.0'
  pod 'ReachabilitySwift'
  pod 'XCGLogger', '~> 7.0.1'
  pod 'SkeletonView'
  pod 'ADCountryPicker'
  pod 'GoogleSignIn'
  pod 'CloudTagView'
  #pod 'DropDown','2.3.4'


  target 'ASCENDTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ASCENDUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
    end
  end
end


# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'FitnestX' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FitnestX
  pod 'IQKeyboardManagerSwift'
  
  # Quality + Generation
  pod 'SwiftLint'
  pod 'R.swift'
  pod 'Swinject', '~> 2.7.1'
  pod 'SwinjectStoryboard', :git => 'https://github.com/Swinject/SwinjectStoryboard.git', :commit => '0ca45c83a8aa398c153d8a036c95abb4343cfa0c'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end

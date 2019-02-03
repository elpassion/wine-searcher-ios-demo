platform :ios, '12.0'
use_frameworks!

target 'WineSearcher' do

  pod 'SwiftLint', '~> 0.30'

  target 'WineSearcherTests' do
    inherit! :search_paths
    
    pod 'iOSSnapshotTestCase', '~> 6.0'
    pod 'Nimble', '~> 7.3'
    pod 'Quick', '~> 1.3'

  end

end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        if target.name == 'iOSSnapshotTestCase'
            target.build_configurations.each do |config|
                config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
            end
        end
    end
end

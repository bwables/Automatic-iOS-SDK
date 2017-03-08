source 'https://github.com/CocoaPods/Specs.git'

workspace 'AutomaticSDK'

target :AutomaticSDK do
    project 'AutomaticSDK'

    platform :ios, '10.0'

    pod 'AFNetworking', '~> 3.0'
    pod 'AFOAuth2Manager', '~> 3.0'
end

target :AutomaticSDKTests do
    project 'AutomaticSDK'

    pod 'Specta', '~> 1.0'
    pod 'Expecta', '~> 1.0'

    pod 'Nocilla', '~> 0.9.0', :inhibit_warnings => true
end

target :ExampleApp do
    project 'Example/ExampleApp'

    pod 'AutomaticSDK', :path => './AutomaticSDK.podspec'
end

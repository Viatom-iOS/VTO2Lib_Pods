#
#  Be sure to run `pod spec lint VTO2Lib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


    spec.name         = "VTO2Lib"
    spec.version      = "1.10.2"
    spec.summary      = "Support communication between Lepu's O2 series products and iOS devices."

    spec.description  = "The SDK supports Lepu's wearable blood oxygen monitoring devices, but excludes the O2Ring II product. The SDK only handles device data communication and does not manage device connection processes. For basic device connection implementation, developers can refer to simplified connection code examples provided in the Demo."

    spec.homepage     = "https://github.com/Viatom-iOS/VTO2Lib_Pods"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author             = { "yangweichao" => "yangweichao@lepucloud.com" }
    spec.ios.deployment_target = "9.0"

    spec.source       = { :git => "https://github.com/Viatom-iOS/VTO2Lib_Pods.git", :tag => spec.version }


    spec.vendored_frameworks = "VTO2Lib.xcframework"
    spec.public_header_files = "VTO2Lib.xcframework/*/VTO2Lib.framework/Headers/*.h"
    spec.source_files = "VTO2Lib.xcframework/**/Headers/*.h"
end

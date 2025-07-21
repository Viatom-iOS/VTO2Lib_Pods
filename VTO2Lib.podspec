#
#  Be sure to run `pod spec lint VTO2Lib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


    spec.name         = "VTO2Lib"
    spec.version      = "1.10.1"
    spec.summary      = "Support communication between Lepu's O2 series products and iOS devices."

    spec.description  = "The SDK supports Lepu's wearable blood oxygen monitoring devices, but excludes the O2Ring II product. The SDK only handles device data communication and does not manage device connection processes. For basic device connection implementation, developers can refer to simplified connection code examples provided in the Demo."

    spec.homepage     = "https://github.com/Viatom-iOS/VTO2Lib_Pods"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author             = { "yangweichao" => "yangweichao@lepucloud.com" }
    spec.ios.deployment_target = "9.0"

    spec.source       = { :git => "https://github.com/Viatom-iOS/VTO2Lib_Pods.git", :tag => spec.version }

    spec.vendored_frameworks = "VTO2Lib.xcframework"
    # 使用主框架路径，不直接指定架构
    spec.public_header_files = "VTO2Lib.xcframework/VTO2Lib.framework/Headers/*.h"
    spec.source_files = "VTO2Lib.xcframework/VTO2Lib.framework/Headers/*.h"

    spec.script_phase = {
        :name => 'Setup VTO2Lib headers',
        :script => <<-SCRIPT
        # 创建统一的头文件目录
        UNIFIED_HEADERS_DIR="${PODS_ROOT}/VTO2Lib/Headers"
        mkdir -p "${UNIFIED_HEADERS_DIR}"

        # 复制当前架构的头文件
        ARCH_PATH=$(ls ${PODS_ROOT}/VTO2Lib/VTO2Lib.xcframework | grep -E 'ios-|macos-' | head -1)
        cp -R "${PODS_ROOT}/VTO2Lib/VTO2Lib.xcframework/${ARCH_PATH}/VTO2Lib.framework/Headers/" "${UNIFIED_HEADERS_DIR}"

        # 更新public_header_files路径
        sed -i '' 's|VTO2Lib.xcframework/VTO2Lib.framework/Headers|Headers|g' "${PODS_ROOT}/Target Support Files/VTO2Lib/VTO2Lib.podspec.json"

        # 创建必要的符号链接
        ln -sfh "${UNIFIED_HEADERS_DIR}" "${PODS_ROOT}/VTO2Lib/VTO2Lib.xcframework/VTO2Lib.framework/Headers"
        SCRIPT,
        :execution_position => :before_compile
    }

end

// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "EforMeSDKWrapper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EforMeSDKWrapper",
            targets: ["EforMeSDKWrapper"]
        )
    ],
    dependencies: [
        // Adobe AEPSDK
        .package(url: "https://github.com/adobe/aepsdk-core-ios.git", exact: "5.6.0"),
        .package(url: "https://github.com/adobe/aepsdk-assurance-ios.git", exact: "5.0.1"),
        .package(url: "https://github.com/adobe/aepsdk-edgeconsent-ios.git", exact: "5.0.0"),
        .package(url: "https://github.com/adobe/aepsdk-messaging-ios.git", exact: "5.7.0"),
        .package(url: "https://github.com/adobe/aepsdk-userprofile-ios.git", exact: "5.0.0"),
        .package(url: "https://github.com/adobe/aepsdk-analytics-ios.git", exact: "5.0.2"),

        // Amplify
        .package(url: "https://github.com/aws-amplify/amplify-swift.git", exact: "2.51.1"),

        // Google Maps
        .package(url: "https://github.com/googlemaps/ios-maps-sdk.git", exact: "9.0.0")
    ],
    targets: [
        // Your XCFramework
        .binaryTarget(
            name: "EforMeSDK",
            path: "Frameworks/EforMeSDK.xcframework"
        ),
        // Wrapper target
        .target(
            name: "EforMeSDKWrapper",
            dependencies: [
                "EforMeSDK",
                
                // Adobe modules
                .product(name: "AEPCore", package: "aepsdk-core-ios"),
                .product(name: "AEPMessaging", package: "aepsdk-messaging-ios"),
                .product(name: "AEPAssurance", package: "aepsdk-assurance-ios"),
                .product(name: "AEPEdgeConsent", package: "aepsdk-edgeconsent-ios"),
                .product(name: "AEPUserProfile", package: "aepsdk-userprofile-ios"),
                .product(name: "AEPAnalytics", package: "aepsdk-analytics-ios"),
                
                // Amplify
                .product(name: "Amplify", package: "amplify-swift"),

    
                // Google Maps
                .product(name: "GoogleMaps", package: "ios-maps-sdk")
            ],
            path: "Sources/EforMeSDKWrapper",
            resources: [
                .process("../../Resources/EforMeAssets.bundle")
            ]
        )
    ]
)

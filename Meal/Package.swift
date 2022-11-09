// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Meal",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Meal",
            targets: ["Meal"]),
    ],
    dependencies: [
      .package(url: "https://github.com/realm/realm-swift", from: "10.32.0"),
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
      .package(url: "https://github.com/geraldymp/CoreOfMealsMaker.git", branch: "master"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Meal",
            dependencies: [
              .product(name: "RealmSwift", package: "realm-swift"),
              "Alamofire",
              "CoreOfMealsMaker"
            ]),
        .testTarget(
            name: "MealTests",
            dependencies: ["Meal"]),
    ]
)

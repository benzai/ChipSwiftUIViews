// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ChipSwiftUIViews",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "ChipSwiftUIViews",
      targets: ["ChipSwiftUIViews"]
    ),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "ChipSwiftUIViews",
      dependencies: [
      ]
    ),
//    .testTarget(
//      name: "ChipSwiftUIViewsTests",
//      dependencies: ["ChipSwiftUIViews"]
//    ),
  ]
)

// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "TagLibKit",
  products: [
    .library(name: "TagLibKit", targets: ["TagLibKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/NCrusher74/TagLib-SPM", .branch("master"))
  ],
  targets: [
    .target(
      name: "TagLibKit",
      dependencies: [
        .product(name: "TagLib", package: "TagLib")
      ],
      path: "",
      publicHeadersPath: ""
    )
  ]
)

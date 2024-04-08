// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "GCDWebServer",
  defaultLocalization: "cn",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v14),
  ],
  products: [
    .library(
      name: "GCDWebServer",
      targets: ["GCDWebServer"]
    ),
  ],
  targets: [
    .target(
      name: "GCDWebServer",
      path: "GCDWebServer",
      exclude:["include/generateSymHeader.sh"],
      sources:["GCDWebUploader","GCDWebDAVServer","Core","Requests","Responses"],
      resources: [
        .copy("GCDWebUploader.bundle") //Bundle files which will not be embeded in dynamic frameworks,will appear in the app's main bundle.
      ],
      cSettings: [
        .headerSearchPath("Core"),
        .headerSearchPath("Requests"),
        .headerSearchPath("Responses")
      ]
    ),
  ],
  swiftLanguageVersions: [.v5]
)

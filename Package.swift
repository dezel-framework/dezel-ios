// swift-tools-version:5.1
import PackageDescription

let package = Package(

    name: "Dezel",

    platforms: [
		.iOS(.v11)
    ],

    products: [
		.library(
			name: "Dezel",
			targets: ["Dezel"]
		),
    ],

	dependencies: [
		.package(url: "https://github.com/dezel-framework/dezel-lib-cache.git", .branch("master")),
		.package(url: "https://github.com/dezel-framework/dezel-lib-websocket.git", .branch("master")),
		.package(url: "https://github.com/dezel-framework/dezel-core-js.git", .branch("master")),
		.package(url: "https://github.com/dezel-framework/dezel-core-ui.git", .branch("master"))
	],

	targets: [

		.target(
			name: "DezelObjC",
			dependencies: [],
			path: "Sources/DezelObjC"
		),

		.target(
			name: "Dezel",
			dependencies: [
				"LibCache",
				"LibWebSocket",
				"DezelObjC",
				"DezelCoreJS",
				"DezelCoreUI"
			]
		),

        .testTarget(
            name: "DezelTests",
            dependencies: ["Dezel"]
		),
    ],

    cLanguageStandard: .gnu11,

    cxxLanguageStandard: .cxx1z
)

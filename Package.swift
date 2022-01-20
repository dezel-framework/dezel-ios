// swift-tools-version:5.3
import PackageDescription

let package = Package(

    name: "Dezel",

    platforms: [
		.iOS(.v11),
    ],

    products: [
		.library(
			name: "Dezel",
			targets: ["Dezel"]
		),
    ],

	dependencies: [
		.package(name: "LibCache", url: "https://github.com/dezel-framework/dezel-lib-cache.git", .branch("master")),
		.package(name: "LibWebSocket", url: "https://github.com/dezel-framework/dezel-lib-websocket.git", .branch("master")),
		.package(name: "DezelCoreJS", path: "../dezel-core-js"),
		.package(name: "DezelCoreUI", path: "../dezel-core-ui"),
//		.package(name: "DezelCoreUI", url: "https://github.com/dezel-framework/dezel-core-ui.git", .branch("master"))
//		.package(name: "DezelCoreJS", url: "https://github.com/dezel-framework/dezel-core-js.git", .branch("master")),
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
			],
			path: "Sources/Dezel",
			resources: [
				.process("Test/TestRunner.js")
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

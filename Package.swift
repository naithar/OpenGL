import PackageDescription

let package = Package(
    name: "SwiftOpenGL",
    targets: [
        Target(name: "COpenGL", dependencies: []),
        Target(name: "SwiftOpenGL", dependencies: ["COpenGL"]),
    ], dependencies: [
    ]
)

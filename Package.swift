import PackageDescription

let package = Package(
    name: "OpenGL",
    targets: [
        Target(name: "COpenGL", dependencies: []),
        Target(name: "OpenGL", dependencies: ["COpenGL"]),
    ], dependencies: [
    ]
)

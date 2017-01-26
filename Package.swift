import PackageDescription

let package = Package(
    name: "SOGL",
    targets: [
        Target(name: "COpenGL", dependencies: []),
        Target(name: "SOGL", dependencies: ["COpenGL"]),
    ], dependencies: [
    ]
)

import PackageDescription

let package = Package(
    name: "sogl",
    dependencies: [
	.Package(url: "https://github.com/naithar/COpenGL.git", majorVersion: 0)
    ]
)

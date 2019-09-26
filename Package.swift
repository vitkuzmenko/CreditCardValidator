// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "CreditCardValidator",
    products: [
        .library(name: "CreditCardValidator", targets: ["CreditCardValidator"])
    ],
    dependencies: [],
    targets: [
         .target(
            name: "CreditCardValidator",
            dependencies: []
        )
    ]
)

//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2023 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

@testable import Spezi
import XCTest
import XCTRuntimeAssertions
import XCTSpezi


private final class ProvideComponent1: Component {
    @Provide var num: Int = 2
    @Provide var numMaybe: Int? = 3
    @Provide var numMaybe2: Int?
    @Provide var numArray: [Int] = []

    @Provide var noCollect: Float = 1

    @Provide var someString: String = "Hello Component"

    init() {
        someString = "Hello World"

        if numArray.isEmpty {
            numArray.append(contentsOf: [4, 5, 6])
        }
    }
}


private final class CollectComponent: Component {
    @Collect var nums: [Int]
    @Collect var strings: [String]

    @Collect var nothingProvided: [UUID]
}


final class ComponentCommunicationTests: XCTestCase {
    private class TestApplicationDelegate: SpeziAppDelegate {
        override var configuration: Configuration {
            Configuration {
                provideComponent
                collectComponent
            }
        }
    }

    private static var provideComponent = ProvideComponent1()
    private static var collectComponent = CollectComponent()


    override func setUp() {
        Self.provideComponent = ProvideComponent1()
        Self.collectComponent = CollectComponent()
    }

    func testSimpleCommunication() throws {
        let delegate = TestApplicationDelegate()
        _ = try XCTUnwrap(delegate.spezi as? Spezi<DefaultStandard>)

        XCTAssertEqual(Self.collectComponent.nums, [2, 3, 4, 5, 6])
        XCTAssertTrue(Self.collectComponent.nothingProvided.isEmpty)
        XCTAssertEqual(Self.collectComponent.strings, ["Hello World"])
    }

    func testIllegalAccess() throws {
        let delegate = TestApplicationDelegate()

        try XCTRuntimePrecondition {
            _ = Self.collectComponent.strings
        }

        _ = try XCTUnwrap(delegate.spezi as? Spezi<DefaultStandard>)

        try XCTRuntimePrecondition {
            Self.provideComponent.numMaybe2 = 12
        }
    }
}

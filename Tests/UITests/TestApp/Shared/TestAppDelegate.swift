//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import Spezi
import SwiftUI
import XCTSpezi


class TestAppDelegate: SpeziAppDelegate {
    override var configuration: Configuration {
        Configuration {
            if FeatureFlags.lifecycleTests {
                LifecycleHandlerTestComponent()
            }
            MultipleObservableObjectsTestsComponent()
            ObservableComponentTestsComponent(message: "Passed")
        }
    }
}

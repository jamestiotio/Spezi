//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import XCTestApp
import XCTSpezi


struct ObservableObjectTestsView: View {
    @EnvironmentObject var testAppComponent: ObservableComponentTestsComponent
    @EnvironmentObject var multipleObservableInt: MultipleObservableObjectsTestsComponent.TestObservableObject<Int>
    @EnvironmentObject var multipleObservableString: MultipleObservableObjectsTestsComponent.TestObservableObject<String>
    
    
    var body: some View {
        TestAppView(
            testCase: ObservableObjectTests(
                testAppComponent: testAppComponent,
                multipleObservableInt: multipleObservableInt,
                multipleObservableString: multipleObservableString
            )
        )
    }
}

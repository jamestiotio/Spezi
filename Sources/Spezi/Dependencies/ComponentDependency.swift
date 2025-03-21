//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// A ``ComponentDependency`` defines the interface of a ``Component/Dependency`` property wrapper.
public protocol ComponentDependency: DependencyDescriptor, AnyObject {
    /// The type of the component that is defined as a dependency.
    associatedtype ComponentType: Component
    
    
    /// The default value defined by the ``Component`` describing the dependency.
    var defaultValue: () -> ComponentType { get }
    /// The resolved dependency provided by the ``Component/Dependency`` property wrapper.
    var wrappedValue: ComponentType { get }
    
    
    /// Inject a resolved ``ComponentDependency/ComponentType`` instance in the property wrapper.
    func inject(dependency: ComponentType)
}

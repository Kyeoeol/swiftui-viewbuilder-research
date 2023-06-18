//
//  ImitatingView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/12.
//

import SwiftUI


// MARK: ImitatingView

public protocol ImitatingView {
    associatedtype Body: ImitatingView
    @ImitatingViewBuilder var body: Self.Body { get }
}
/// Debug Tool
public extension ImitatingView {
    @ImitatingViewBuilder
    func debug() -> some ImitatingView {
        let _ = print(Mirror(reflecting: self).subjectType)
        return self
    }
}


/// When SwiftUI encounters these view types, it does not attempt to access their body property content (Never is untouchable),
/// but instead processes them according to their specific logic.
/// Therefore, we need to make Never conform to the View protocol to continue the work below:
extension Never: ImitatingView {
    public typealias Body = Never
    public var body: Never { fatalError() }
}


// MARK: Basic Views

// EmptyView
/// EmptyView is a view that does nothing, it is just an empty view
public struct ImitatingEmptyView: ImitatingView {
    public typealias Body = Never
    public var body: Never { fatalError() }
    public init() {}
}


// Group
public struct ImitatingGroup<Content>: ImitatingView {
    var content: Content
    public var body: Never { fatalError() }
    public init(@ImitatingViewBuilder _ content: () -> Content) {
        self.content = content()
    }
}


// Text
public struct ImitatingText: ImitatingView {
    public typealias Body = Never
    public var body: Never { fatalError() }
    /// In SwiftUI, an enumeration type is used to distinguish between String and LocalizedStringKey,
    /// and the imitation process will be simplified uniformly.
    var content: String
    public init(_ content: String) {
        self.content = content
    }
}

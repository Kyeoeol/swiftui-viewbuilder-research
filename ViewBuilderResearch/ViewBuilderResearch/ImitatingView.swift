//
//  ImitatingView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/12.
//

import SwiftUI

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
    public var body: Never { return fatalError() }
}


/// EmptyView is a view that does nothing, it is just an empty view
public struct EmptyView: ImitatingView {
    public typealias Body = Never
    public var body: Never { return fatalError() }
    public init() {}
}



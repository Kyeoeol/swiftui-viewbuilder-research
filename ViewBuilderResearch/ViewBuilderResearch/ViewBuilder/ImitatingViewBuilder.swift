//
//  ImitatingViewBuilder.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/12.
//

import SwiftUI

@resultBuilder
public enum ImitatingViewBuilder {
    
    /// For an empty closure, set the return type to EmptyView
    public static func buildBlock() -> ImitatingEmptyView {
        ImitatingEmptyView()
    }
    
    /// For a single component, buildBlock will preserve its original type
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: ImitatingView {
        content
    }
    
}


// MARK: TupleView

public extension ImitatingViewBuilder {
    
    /// Return TupleView<> for 2 to ... components
    /// Currently, SwiftUI only supports up to 10 components for buildBlock overloads,
    /// so we can only declare up to 10 views in the same level of a view closure.
    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0: ImitatingView, C1: ImitatingView {
        TupleView((c0, c1))
    }
    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0: ImitatingView, C1: ImitatingView, C2: ImitatingView {
        TupleView((c0, c1, c2))
    }
    
    //...
    /*
     There is currently a proposal under review for result builders which adds a buildPartialBlock method.
     If this proposal is accepted, only implementing
     buildPartialBlock(first: Component) -> Component and buildPartialBlock(accumulated: Component, next: Component) -> Component would be able to handle any number of components.
     */
}
// SwiftUI handles different numbers of components
// by creating multiple overloaded buildBlocks that return a TupleView.
public struct TupleView<T>: ImitatingView {
    var content: T
    public var body: Never { fatalError() }
    public init(_ content: T) {
        self.content = content
    }
}
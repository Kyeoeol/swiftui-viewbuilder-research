//
//  ImitatingViewModifier.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/07/02.
//

import Foundation

public protocol ImitatingViewModifier {
    associatedtype Body: ImitatingView
    typealias Content = _ImitatingViewModifier_Content<Self>
    @ImitatingViewBuilder func body(content: Content) -> Self.Body
}

// _ImitatingViewModifier_Content
public struct _ImitatingViewModifier_Content<Modifier>: ImitatingView where Modifier: ImitatingViewModifier {
    public typealias Body = Never
    public var body: Never { fatalError() }
}

// ModifiedContent
public struct ModifiedContent<Content, Modifier>: ImitatingView where Content: ImitatingView, Modifier: ImitatingViewModifier {
    public typealias Body = Never
    public var content: Content
    public var modifier: Modifier
    public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
    
    public var body: ModifiedContent<Content, Modifier>.Body {
        fatalError()
    }
}


// MARK: Overlay

public struct _OverlayModifier<Overlay>: ImitatingViewModifier where Overlay: ImitatingView {
    public var overlay: Overlay
    public init(overlay: Overlay) {
        self.overlay = overlay
    }
    
    public func body(content: Content) -> Never {
        fatalError()
    }
}

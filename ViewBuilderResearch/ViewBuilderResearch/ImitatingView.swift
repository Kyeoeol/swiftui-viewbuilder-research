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
/// Modifier
public extension ImitatingView {
    func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        ModifiedContent(content: self, modifier: modifier)
    }
    func overlay<Overlay>(_ overlay: Overlay) -> some ImitatingView where Overlay: ImitatingView {
        modifier(_OverlayModifier(overlay: overlay))
    }
    func overlay<Overlay>(@ImitatingViewBuilder _ overlay: () -> Overlay) -> some ImitatingView where Overlay: ImitatingView {
        modifier(_OverlayModifier(overlay: overlay()))
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
    var modifiers: [Modifier] = [] // records the modifiers used
    public init(_ content: String) {
        self.content = content
    }
}
public extension ImitatingText {
    /// SwiftUI lists the modifiers that apply only to the Text view using an enumeration.
    enum Modifier {
        case color(Color?)
        /*
        case font(Font?)
        case italic
        case weight(Font.Weight?)
        case kerning(CGFloat)
        case tracking(CGFloat)
        case baseline(CGFloat)
        case rounded
        case anyTextModifier(AnyTextModifier)
        */
    }
    
    /// There are the following advantages to handling modifiers in this way:
    /// 1. The information is only passed during transcription, and the modifier is only processed during layout or rendering.
    /// 2. It is easy to be compatible with different frameworks (UIKit, AppKit).
    /// 3. The priority logic of modifiers is consistent with SwiftUI’s common modifiers — inner layers have higher priority.
    func foregroundColor(_ color: Color?) -> ImitatingText {
        guard !modifiers.contains(where: {
            if case .color = $0 { return true }
            else { return false }
        })
        else { return self }
        var text = self
        text.modifiers.append(.color(color))
        return text
    }
}

// AnyView
/// Since SwiftUI identifies views through their type and position in the view hierarchy, AnyView will erase (hide) this important information.
/// Therefore, we should try to avoid using AnyView in SwiftUI as much as possible, unless it’s absolutely necessary.
protocol TypeErasing {
    var view: Any { get }
}
public struct ImitatingAnyView: ImitatingView {
    var eraser: TypeErasing
    public var body: Never { fatalError() }
    public init<V>(_ content: V) where V: ImitatingView {
        self.eraser = ViewEraser(content)
    }
    var wrappedView: Any {
        eraser.view
    }
    class ViewEraser<V: ImitatingView>: TypeErasing {
        let originView: V
        var view: Any {
            originView
        }
        init(_ view: V) {
            self.originView = view
        }
    }
}

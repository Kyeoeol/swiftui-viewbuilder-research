//
//  AttributedStringBuilder.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

@resultBuilder
enum AttributedStringBuilder {
    /// 블록에서 컴포넌트를 사용하지 않는 경우에 해당
    static func buildBlock() -> AttributedString {
        AttributedString("")
    }
    /// 블록에서 n개의 구성 요소(n은 양의 정수)를 사용하는 경우에 해당
    static func buildBlock(_ components: AttributedString...) -> AttributedString {
        components.reduce(into: AttributedString("")) { result, next in
            result.append(next)
        }
    }
    
    /// Simplified expression
    static func buildExpression(_ string: String) -> AttributedString {
        AttributedString(string)
    }
    /// Solve issue that unable to mix String and AttributedString in a block.
    /// Now you can mix and use both(String &AttributedString) in a block.
    static func buildExpression(_ attributedString: AttributedString) -> AttributedString {
        attributedString
    }
    
    /// Add support for if statements without else
    static func buildOptional(_ component: AttributedString?) -> AttributedString {
        component ?? AttributedString("")
    }
}

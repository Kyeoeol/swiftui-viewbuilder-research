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
    
    
    // For `if else` and `switch` syntax,
    // you need to implement two methods: `buildEither(first:)` and `buildEither(second:)`
    /// Called for the branch where the condition is true (left branch)
    static func buildEither(first component: AttributedString) -> AttributedString {
        component
    }
    /// Called for the branch where the condition is false (right branch)
    static func buildEither(second component: AttributedString) -> AttributedString {
        component
    }
    
    
    /// In this example, we simply concatenate all the iteration results to generate an AttributedString
    static func buildArray(_ components: [AttributedString]) -> AttributedString {
        components.reduce(into: AttributedString("")) { result, next in
            result.append(next)
        }
    }
    
    
    /// If the implementation of buildLimitedAvailability is provided, the builder provides support for API availability checks (such as if #available(..)).
    static func buildLimitedAvailability(_ component: AttributedString) -> AttributedString {
        component
    }
    
    
    /// If we provide an implementation of buildFinalResult,
    ///  the builder will use it to transform the result again at the end of the translation process,
    ///  and the final result will be the return value of buildFinalResult.
//    static func buildFinalResult(_ component: AttributedString) -> Text {
//        Text(component)
//    }
}

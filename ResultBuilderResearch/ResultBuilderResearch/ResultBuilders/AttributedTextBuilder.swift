//
//  AttributedTextBuilder.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/11.
//

import SwiftUI

@resultBuilder
enum AttributedTextBuilder {
    
    static func buildBlock(_ components: AttributedText...) -> AttributedString {
        let result = components
            .map { $0.content }
            .reduce(into: AttributedString("")) { result, next in
                result.append(next)
            }
        return result.content
    }
    
    
    static func buildExpression(_ string: String) -> AttributedString {
        AttributedString(string)
    }
    static func buildExpression(_ attributedString: AttributedText) -> AttributedString {
        attributedString.content
    }
    
    
    static func buildOptional(_ component: AttributedText?) -> AttributedString {
        component?.content ?? AttributedString("")
    }
    
    
    static func buildEither(first component: AttributedText) -> AttributedString {
        component.content
    }
    static func buildEither(second component: AttributedText) -> AttributedString {
        component.content
    }
    
    
    static func buildArray(_ components: [AttributedText]) -> AttributedString {
        let result = components
            .map { $0.content }
            .reduce(into: AttributedString("")) { result, next in
                result.append(next)
            }
        return result.content
    }
    
    
    static func buildLimitedAvailability(_ component: AttributedText) -> AttributedString {
        component.content
    }
    
}
 

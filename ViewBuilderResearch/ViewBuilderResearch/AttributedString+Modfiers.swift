//
//  AttributedString+Modfiers.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

extension AttributedString {
    
    // color
    func color(_ color: Color) -> AttributedString {
        then {
            $0.foregroundColor = color
        }
    }
    
    
    // font
    func bold() -> AttributedString {
        then {
            if var inlinePresentationIntent = $0.inlinePresentationIntent {
                var container = AttributeContainer()
                inlinePresentationIntent.insert(.stronglyEmphasized)
                container.inlinePresentationIntent = inlinePresentationIntent
                $0.mergeAttributes(container)
            }
            else {
                $0.inlinePresentationIntent = .stronglyEmphasized
            }
        }
    }
    
    func italic() -> AttributedString {
        then {
            if var inlinePresentationIntent = $0.inlinePresentationIntent {
                var container = AttributeContainer()
                inlinePresentationIntent.insert(.emphasized)
                container.inlinePresentationIntent = inlinePresentationIntent
                $0.mergeAttributes(container)
            }
            else {
                $0.inlinePresentationIntent = .emphasized
            }
        }
    }
    
    
    // then
    func then(_ perform: (inout Self) -> Void) -> Self {
        var result = self
        perform(&result)
        return result
    }
    
}

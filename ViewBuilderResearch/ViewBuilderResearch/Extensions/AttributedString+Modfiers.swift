//
//  AttributedString+Modfiers.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

extension AttributedString: AttributedText {
    
    var content: AttributedString {
        self
    }
    
    init(_ attributed: AttributedString) {
        self = attributed
    }
    
}

extension AttributedString {
    func then(_ perform: (inout Self) -> Void) -> Self {
        var result = self
        perform(&result)
        return result
    }
}


// MARK: -

extension AttributedString {
    
    func color(_ color: Color) -> AttributedString {
        /// Implemented the rule that inner attribute settings take precedence over outer attribute settings.
        var container = AttributeContainer()
        container.foregroundColor = color
        return then {
            for run in $0.runs {
                $0[run.range].mergeAttributes(
                    container,
                    mergePolicy: .keepCurrent
                )
            }
        }
    }
    
    func bold() -> AttributedString {
        /// Implemented the rule that inner attribute settings take precedence over outer attribute settings.
        then {
            for run in $0.runs {
                if var inlinePresentationIntent = run.inlinePresentationIntent {
                    var container = AttributeContainer()
                    inlinePresentationIntent.insert(.stronglyEmphasized)
                    container.inlinePresentationIntent = inlinePresentationIntent
                    $0[run.range].mergeAttributes(
                        container,
                        mergePolicy: .keepCurrent
                    )
                }
                else {
                    $0[run.range].inlinePresentationIntent = .stronglyEmphasized
                }
            }
        }
    }
    
    func italic() -> AttributedString {
        /// Implemented the rule that inner attribute settings take precedence over outer attribute settings.
        then {
            for run in $0.runs {
                if var inlinePresentationIntent = run.inlinePresentationIntent {
                    var container = AttributeContainer()
                    inlinePresentationIntent.insert(.emphasized)
                    container.inlinePresentationIntent = inlinePresentationIntent
                    $0[run.range].mergeAttributes(
                        container,
                        mergePolicy: .keepCurrent
                    )
                }
                else {
                    $0[run.range].inlinePresentationIntent = .emphasized
                }
            }
        }
    }
    
}


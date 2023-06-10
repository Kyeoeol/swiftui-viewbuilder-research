//
//  String+Modifiers.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

extension String {
    
    func color(_ color: Color) -> AttributedString {
        AttributedString(self)
            .color(color)
    }
    
    func bold() -> AttributedString {
        AttributedString(self)
            .bold()
    }
    
    func italic() -> AttributedString {
        AttributedString(self)
            .italic()
    }
    
}

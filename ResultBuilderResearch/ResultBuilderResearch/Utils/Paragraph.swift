//
//  Paragraph.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/11.
//

import SwiftUI

struct Paragraph: AttributedText {
    
    var content: AttributedString
    
    init(_ attributed: AttributedString) {
        content = attributed
    }
    init(
        @AttributedTextBuilder _ attributedText: () -> AttributedText
    ) {
        self.content = "\n" + attributedText().content + "\n"
    }
    
}

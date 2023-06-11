//
//  AttributedStringBuilderView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct AttributedStringBuilderView: View {
    
    // Simple example 1
    @AttributedStringBuilder
    var txt: AttributedString {
        "Hello,"
        "World!"
        let _ = print("UPDATED.") /// Declaration statements will not affect the builder's translation.
    }
    // Simple example 2
    @AttributedStringBuilder
    func txt2() -> AttributedString {}
    
    
    // Marked on the API side
    func generateText(
        @AttributedStringBuilder _ content: () -> AttributedString
    ) -> Text {
        Text(content())
    }
    
    
    // Make Model
    struct MyText {
        var content: AttributedString
        
        init(
            @AttributedStringBuilder _ content: () -> AttributedString
        ) {
            self.content = content()
        }
    }
    let myText = MyText {
        "~**Hello,**~ "
            .localized()
            .color(.red)
        /// Use Markdown syntax to describe bold text.
        /// When using Markdown syntax, setting inlinePresentationIntent directly will cause conflicts
//            .bold()
        AttributedString("World!")
            .color(.green)
            .bold()
    }.content
    
    
    // MARK: Body
    
    var body: some View {
        // Simple example
//        Text(txt2())
        
        
        // Marked on the API side
//        generateText {
//            AttributedString("Hello, ")
//            AttributedString("World!")
//        }
        
        
        // Make Model
        Text(myText)
            .font(.title)
    }
    
}

struct AttributedStringBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringBuilderView()
    }
}

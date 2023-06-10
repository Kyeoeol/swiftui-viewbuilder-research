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
        AttributedString("Hello,")
        AttributedString("World!")
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
        AttributedString("Hello, ")
        AttributedString("World!")
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
    }
    
}

struct AttributedStringBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringBuilderView()
    }
}


// MARK: ResultBuilder

@resultBuilder
enum AttributedStringBuilder {
    // 블록에서 컴포넌트를 사용하지 않는 경우에 해당
    static func buildBlock() -> AttributedString {
        AttributedString("")
    }
    // 블록에서 n개의 구성 요소(n은 양의 정수)를 사용하는 경우에 해당
    static func buildBlock(_ components: AttributedString...) -> AttributedString {
        components.reduce(into: AttributedString("")) { result, next in
            result.append(next)
        }
    }
}

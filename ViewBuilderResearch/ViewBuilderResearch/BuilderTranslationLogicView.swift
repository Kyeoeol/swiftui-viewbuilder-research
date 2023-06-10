//
//  BuilderTranslationLogicView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct BuilderTranslationLogicView: View {
    
//    @AttributedStringBuilder
//    var myFirstText: AttributedString {
//        "Hello"
//        AttributedString("World")
//             .color(.red)
//    }
    /// When the builder processes the above code,
    /// it will be translated into the following code:
    var myFirstText: AttributedString {
        let _a = AttributedStringBuilder.buildExpression("Hello")
        let _b = AttributedStringBuilder.buildExpression(AttributedString("World"))
        return AttributedStringBuilder.buildBlock(_a, _b)
    }
    
    
    // MARK: Body
    
    var body: some View {
        Text(myFirstText)
    }
}

struct BuilderTranslationLogicView_Previews: PreviewProvider {
    static var previews: some View {
        BuilderTranslationLogicView()
    }
}

//
//  BuildOptionalView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct BuildOptionalView: View {
    
    var isShow = true
    
    // Example: Add support for `if` statements without `else`
    // implemented `buildOptional(_:)`
    
//    @AttributedStringBuilder
//    var myFirstText: AttributedString {
//        "Hello, "
//        if isShow {
//            "World!"
//        }
//    }
    
    // `buildOptional(_:)` 구현을 추가한 후, Builder는  if let 구문을 지원한다.
    var name: String? = "Jude"
    
//    @AttributedStringBuilder
//    var myFirstText: AttributedString {
//        "Hello, "
//        if let name = name {
//            name
//        }
//    }
    
    
    // Logic corresponding to the if statement above
    @AttributedStringBuilder
    var myFirstText: AttributedString {
        let _a = AttributedStringBuilder.buildExpression("Hello, ")
        let _b = AttributedStringBuilder.buildOptional(
            isShow ? AttributedStringBuilder.buildExpression("World!") : nil
        )
        AttributedStringBuilder.buildBlock(_a, _b)
    }
    
    
    // MARK: Body
    
    var body: some View {
        Text(myFirstText)
    }
}

struct BuildOptionalView_Previews: PreviewProvider {
    static var previews: some View {
        BuildOptionalView()
    }
}

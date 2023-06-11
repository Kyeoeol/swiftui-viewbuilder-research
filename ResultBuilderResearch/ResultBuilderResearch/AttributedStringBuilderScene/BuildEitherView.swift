//
//  BuildEitherView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct BuildEitherView: View {
    
    var isShow = true
    
//    @AttributedStringBuilder
//    var myFirstText: AttributedString {
//        if isShow {
//            "Hello"
//        }
//        else {
//            "World"
//        }
//    }
    
    // Logic corresponding to the if statement above
    @AttributedStringBuilder
    var myFirstText: AttributedString {
        var vMerged: AttributedString {
            if isShow {
                return AttributedStringBuilder.buildEither(
                    first: AttributedStringBuilder.buildExpression("Hello")
                )
            }
            else {
                return AttributedStringBuilder.buildEither(
                    second: AttributedStringBuilder.buildExpression("World")
                )
            }
        }
        AttributedStringBuilder.buildBlock(vMerged)
    }
    
    
    // MARK: Body
    var body: some View {
        Text(myFirstText)
    }
}

struct BuildEitherView_Previews: PreviewProvider {
    static var previews: some View {
        BuildEitherView()
    }
}

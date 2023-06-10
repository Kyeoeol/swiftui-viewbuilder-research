//
//  BuildFinalResultView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct BuildFinalResultView: View {
    
//    @StringBuilder
//    var myFirstText: Text {
//        "Hello, World!"
//    }
    
    // Logic corresponding to the if statement above
    @StringBuilder
    var myFirstText: Text {
        let exp = StringBuilder.buildExpression("Hello, World!")
        let block = StringBuilder.buildBlock(exp)
        return StringBuilder.buildFinalResult(block)
    }
    
    
    // MARK: Body
    
    var body: some View {
        myFirstText
    }
}

struct BuildFinalResultView_Previews: PreviewProvider {
    static var previews: some View {
        BuildFinalResultView()
    }
}


@resultBuilder
enum StringBuilder {
    static func buildBlock(_ components: String...) -> String {
        components.reduce(into: String("")) { result, next in
            result.append(next)
        }
    }
    
    static func buildExpression(_ expression: String) -> String {
        expression
    }
    
    /// If we provide an implementation of buildFinalResult,
    ///  the builder will use it to transform the result again at the end of the translation process,
    ///  and the final result will be the return value of buildFinalResult.
    static func buildFinalResult(_ component: String) -> Text {
        Text(component)
    }
}

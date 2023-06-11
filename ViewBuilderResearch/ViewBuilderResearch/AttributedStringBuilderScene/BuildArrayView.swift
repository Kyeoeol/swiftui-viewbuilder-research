//
//  BuildArrayView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct BuildArrayView: View {
    
//    @AttributedStringBuilder
//    func myText(count: Int) -> AttributedString {
//        for i in 0..<count {
//            "\(i + 1)"
//        }
//    }
    
    // Logic corresponding to the if statement above
    @AttributedStringBuilder
    func myText(count: Int) -> AttributedString {
        var vArray = [AttributedString]()
        for i in 0..<count {
            vArray.append(
                AttributedStringBuilder.buildExpression("\(i + 1)")
            )
        }
        let _a = AttributedStringBuilder.buildArray(vArray)
        return AttributedStringBuilder.buildBlock(_a)
    }
    
    
    // MARK: Body
    
    var body: some View {
        Text(
            myText(count: 10)
        )
    }
}

struct BuildArrayView_Previews: PreviewProvider {
    static var previews: some View {
        BuildArrayView()
    }
}

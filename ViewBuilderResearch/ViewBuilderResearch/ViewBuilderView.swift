//
//  ViewBuilderView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI

struct ViewBuilderView: View {
    
    @State private var name = "a"
    
    // Failure Tes
    
    /// Builder automatically translates and the block only returns the final synthesized result.
    /// The code can be executed normally.
    @ViewBuilder
    func blockTest1() -> some View {
        if name.isEmpty {
            Text("Bye Bye~")
        }
        else {
            Rectangle()
                .overlay(
                    Text("Hello, \(name)")
                        .foregroundColor(.white)
                )
        }
    }
    /// The builder's translation behavior is ignored due to the `return` keyword.
    /// The two branches of the selection statement in the block return two different types,
    /// which does not meet the requirement of returning the same type (`some View`). Compilation fails.
//    @ViewBuilder
//    func blockTest2() -> some View {
//        if name.isEmpty {
//            return Text("Bye Bye~")
//        }
//        else {
//            return  Rectangle()
//                .overlay(
//                    Text("Hello, \(name)")
//                        .foregroundColor(.white)
//                )
//        }
//    }
    
    
    // MARK: Body
    
    var body: some View {
        blockTest1()
    }
}

struct ViewBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderView()
    }
}

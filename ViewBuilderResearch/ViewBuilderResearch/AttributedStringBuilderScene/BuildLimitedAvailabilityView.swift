//
//  BuildLimitedAvailabilityView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/10.
//

import SwiftUI
 
struct BuildLimitedAvailabilityView: View {
    
//    @AttributedStringBuilder
//    var myFirstText: AttributedString {
//        if #available(iOS 17, *) {
//            AttributedString("iOS 17")
//                .futureMethod()
//        }
//        else {
//            AttributedString("iOS...")
//        }
//    }
        
    // Logic corresponding to the if statement above
    @AttributedStringBuilder
    var myFirstText: AttributedString {
        let vMerger: AttributedString
        if #available(iOS 14, *) {
            let _temp = AttributedStringBuilder
                .buildLimitedAvailability(
                    AttributedStringBuilder.buildExpression(
                        AttributedString("iOS 14")
                            .futureMethod()
                    )
                )
            vMerger = AttributedStringBuilder.buildEither(first: _temp)
        }
        else {
            vMerger = AttributedStringBuilder.buildEither(
                second: AttributedStringBuilder.buildExpression(AttributedString("iOS..."))
            )
        }
        return AttributedStringBuilder.buildBlock(vMerger)
    }
        
        
    // MARK: Body
    
    var body: some View {
        Text(myFirstText)
    }
}

struct BuildLimitedAvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        BuildLimitedAvailabilityView()
    }
}


@available(iOS 14.0, *)
extension AttributedString {
    func futureMethod() -> AttributedString {
        self
    }
}

//
//  AttributedText.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/11.
//

import SwiftUI

/*
 Insufficiencies of AttributedStringBuilder.
 - components에 modifier를 하나씩만 추가할 수 있으며, 균일하게 구성할 수 없다
 - 동적인 배치가 불가능하고 줄바꿈을 하기 위해서는 별도로 `\n`를 추가해야 한다.
 
 위 문제들의 주된 이유는 components 타입이 AttributedString으로 제한되어 있기 때문이다.
 문제를 해결하기 위해 특정 타입이 아닌 프로토콜을 준수하도록 구현할 수 있다.
 */
protocol AttributedText {
    var content: AttributedString { get }
    init(_ attributed: AttributedString)
}


// MARK: Modifier for AttributedText:

extension AttributedText {
    
    func transform(_ perform: (inout AttributedString) -> Void) -> Self {
        var attributed = self.content
        perform(&attributed)
        return Self(attributed)
    }
    
    
    func color(_ color: Color) -> AttributedText {
        transform {
            $0 = $0.color(color)
        }
    }
    
    func bold() -> AttributedText {
        transform {
            $0 = $0.bold()
        }
    }
    
    func italic() -> AttributedText {
        transform {
            $0 = $0.italic()
        }
    }
    
}

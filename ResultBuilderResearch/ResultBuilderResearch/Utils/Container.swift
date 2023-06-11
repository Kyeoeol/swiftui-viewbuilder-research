//
//  Container.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/11.
//

import SwiftUI

/*
 - Container는 SwiftUI의 그룹과 유사
 - 레이아웃을 변경하지 않으면서 Container 내부의 요소에 modifier를 균일하게 적용할 수 있다.
 */

struct Container: AttributedText {
    
    var content: AttributedString
    
    init(_ attributed: AttributedString) {
        self.content = attributed
    }
    init(
        @AttributedTextBuilder _ attributedText: () -> AttributedText
    ) {
        self.content = attributedText().content
    }
    
}

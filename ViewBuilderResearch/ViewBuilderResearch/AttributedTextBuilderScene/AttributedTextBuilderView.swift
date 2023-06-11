//
//  AttributedTextBuilderView.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/11.
//

import SwiftUI

struct AttributedTextBuilderView: View {
    
    @AttributedTextBuilder
    var attributedText: AttributedText {
        Container {
            "Hello, "
                .bold()
                .color(.red)
            
            "World!"
        }
        .italic()
        .color(.green)
        
    }
    
    
    // MARK: Body
    
    var body: some View {
        Text(attributedText.content)
            .font(.title)
    }
}

struct AttributedTextBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedTextBuilderView()
    }
}

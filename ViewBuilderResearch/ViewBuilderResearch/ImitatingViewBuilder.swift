//
//  ImitatingViewBuilder.swift
//  ViewBuilderResearch
//
//  Created by @Kyeol on 2023/06/12.
//

import SwiftUI

@resultBuilder
public enum ImitatingViewBuilder {
    
    /// For an empty closure, set the return type to EmptyView
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
}

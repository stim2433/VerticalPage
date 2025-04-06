//
//  VerticalPagerPreferensKey.swift
//  VerticalPager
//
//  Created by div.Prokhorov on 07.04.2025.
//

import SwiftUI


struct VerticalPagerPreferensKey<T: Hashable>: PreferenceKey {
    static var defaultValue: [T] { [] }
    
    static func reduce(value: inout [T], nextValue: () -> [T]) {
        value.append(contentsOf: nextValue())
    }
}

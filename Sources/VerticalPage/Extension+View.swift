//
//  Extension+View.swift
//  VerticalPager
//
//  Created by div.Prokhorov on 07.04.2025.
//
#if os(iOS)
import SwiftUI

extension View {
    public func pageTag<T: Hashable>(_ tag: T) -> some View {
        modifier(PageView(tag: tag))
            .preference(key: VerticalPagerPreferensKey<T>.self, value: [tag])
    }
}
#endif

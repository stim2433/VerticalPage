//
//  PageView.swift
//  VerticalPager
//
//  Created by div.Prokhorov on 07.04.2025.
//
#if os(iOS)
import SwiftUI

struct PageView<T: Hashable>: ViewModifier {
    let tag: T
    
    func body(content: Content) -> some View {
        content
            .id(tag)
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            )
            .edgesIgnoringSafeArea(.top)
    }
}
#endif

//
//  PreviewSingleView.swift
//  VerticalPager
//
//  Created by div.Prokhorov on 07.04.2025.
//
#if os(iOS)
import SwiftUI

struct PreviewVerticalPager: View {
    @State var slection: Int = 0
    @State var itemHeight: CGFloat = 700
    @State private var isScrolling: Bool = false
    
    var body: some View {
        VerticalPager(selection: $slection, isScrolling: $isScrolling) {
            ScrollView {
                Text("Hello, World! 0")
                    .pageTag(0, height: itemHeight)
                Text("Hello, World! 1")
                    .pageTag(1, height: itemHeight)
                Text("Hello, World! 1")
                    .pageTag(2, height: itemHeight)
            }
        }
    }
}

#Preview {
    PreviewVerticalPager()
}
#endif

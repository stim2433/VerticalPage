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
    var body: some View {
        VerticalPager(selection: $slection) {
            ScrollView {
                Text("Hello, World! 0")
                    .pageTag(0)
                Text("Hello, World! 1")
                    .pageTag(1)
                Text("Hello, World! 1")
                    .pageTag(2)
            }
        }
    }
}

#Preview {
    PreviewVerticalPager()
}
#endif

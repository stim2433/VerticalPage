//
//  PreviewForView.swift
//  VerticalPager
//
//  Created by div.Prokhorov on 07.04.2025.
//
#if os(iOS)
import SwiftUI

struct PreviewForView: View {
    @State private var slection: Int = 0
    @State var itemHeight: CGFloat = 700
    @State private var isScrolling: Bool = false
    
    var body: some View {
        VerticalPager(selection: $slection, isScrolling: $isScrolling) {
            ScrollView {
                ForEach(0..<10, id: \.self) { index in
                    VStack {
                        Text("item - \(index)")
                            .pageTag(index, height: itemHeight)
                    }
                    .cornerRadius(
                        isScrolling ? 30 : 0
                    )
                }
            }
        }
    }
}

#Preview {
    PreviewForView()
}
#endif

//
//  VerticalPager.swift
//  VerticalPager
//
//  Created by StimLite on 06.04.2025.
//
#if os(iOS)
import SwiftUI

struct VerticalPager<T: Hashable, Content: View>: View {
    @Binding var selection: T
    @ViewBuilder var content: () -> Content
    @GestureState private var dragOffset: CGFloat = 0
    
    @State private var tags: [T] = []
    var body: some View {
        ScrollViewReader { proxy in
            content()
                .onPreferenceChange(VerticalPagerPreferensKey<T>.self) {
                    tags = $0
                }
                .simultaneousGesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.height
                        }
                        .onEnded { value in
                            let verticalDirection = value.translation.height > 0 ? -1 : 1
                            print("value", verticalDirection)
                            
                            if verticalDirection > 0 {
                                moveToNextPage()
                            } else {
                                moveToPreviousPage()
                            }
                        }
                )
                .onChange(of: selection) { newValue in
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(newValue, anchor: .top)
                    }
                }
                
        }
        
    }
    private func moveToNextPage() {
        if let currentIndex = tags.firstIndex(of: selection), currentIndex < tags.count - 1 {
            selection = tags[currentIndex + 1]
        }
    }
    
    private func moveToPreviousPage() {
        if let currentIndex = tags.firstIndex(of: selection), currentIndex > 0 {
            selection = tags[currentIndex - 1]
        }
    }
}

#endif

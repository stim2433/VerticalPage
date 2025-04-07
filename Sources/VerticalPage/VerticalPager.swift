//
//  VerticalPager.swift
//  VerticalPager
//
//  Created by StimLite on 06.04.2025.
//
#if os(iOS)
import SwiftUI

public struct VerticalPager<T: Hashable, Content: View>: View {
    @Binding var selection: T
    @Binding var isScrolling: Bool
    
    @ViewBuilder var content: () -> Content
    @GestureState private var dragOffset: CGFloat = 0
    
    @State private var tags: [T] = []
    
    public init(
        selection: Binding<T>,
        isScrolling: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = selection
        self._isScrolling = isScrolling
        self.content = content
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            content()
                .edgesIgnoringSafeArea(.top)
                .onPreferenceChange(VerticalPagerPreferensKey<T>.self) {
                    tags = $0
                }
                .simultaneousGesture(
                    DragGesture()
                        .onChanged { value in
                            isScrolling = true
                        }
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
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                isScrolling = false
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

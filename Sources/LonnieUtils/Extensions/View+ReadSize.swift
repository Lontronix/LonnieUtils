//
//  View+ReadSize.swift
//
//  From https://github.com/FiveStarsBlog/CodeSamples/blob/0d764ee68ee1cfd634f6726f2867dcba383ebe99/SwiftUI-read-a-view-size/View%2BreadSize.swift
//
//  Created by Lonnie Gerol on 11/22/23.
//

import SwiftUI

// MARK: - SizePreferenceKey
public struct SizePreferenceKey: PreferenceKey {

  public static var defaultValue: CGSize = .zero

  public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}

}


/*

Example:

var body: some View {
  childView
    .readSize { newSize in
      print("The new child size is: \(newSize)")
    }
}
*/

// MARK: - readSize
public extension View {

  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }

}

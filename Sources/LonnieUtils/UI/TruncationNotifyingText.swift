//
//  TruncationNotifyingText.swift
//
//
//  Created by Lonnie Gerol on 11/22/23.
//

import SwiftUI

// MARK: - TextIsTruncatedPreferenceKey
public struct TextIsTruncatedPreferenceKey: PreferenceKey {

    public static var defaultValue = false

    public static func reduce(value: inout Bool, nextValue: () -> Bool) { value = nextValue() }
}

// MARK: - TruncationNotifyingText
public struct TruncationNotifyingText: View {

    /// The maximum number of lines (`nil` if no limit)
    let lineLimit: Int?

    /// Note: the passed text should not include a `.lineLimit` modifier or this won't work properly
    @ViewBuilder
    var text: Text

    public init(lineLimit: Int?, @ViewBuilder text: () -> Text) {
        self.lineLimit = lineLimit
        self.text = text()
    }

    /// The size needed to display the text without truncating
    @State private var intrinsicContentSize: CGSize = .zero

    /// The size of the potentially truncated text when it is constrained to `lineLimit` lines
    @State private var displayedSize: CGSize = .zero

    private var isTruncated: Bool {
        return (
            intrinsicContentSize != displayedSize &&
            intrinsicContentSize != .zero &&
            displayedSize != .zero
        )
    }

    public var body: some View {
        text
            .lineLimit(lineLimit)
            .readSize { size in
                self.displayedSize = size
            }
            .background {
                text
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .hidden()
                    .readSize { size in
                        self.intrinsicContentSize = size
                    }
            }
            .preference(key: TextIsTruncatedPreferenceKey.self, value: isTruncated)
    }

}

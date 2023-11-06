//
//  File.swift
//  
//
//  Created by Lonnie Gerol on 11/5/23.
//

import SwiftUI

struct CloseButton: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(
                    minWidth: LonnieUtilConstants.minBarButtonHeight,
                    minHeight: LonnieUtilConstants.minBarButtonHeight
                )
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.gray)
                .symbolRenderingMode(.hierarchical)
                .dynamicTypeSize(.medium)
        }
    }
}

//
//  String.swift
//
//
//  Created by Lonnie Gerol on 11/8/23.
//

import Foundation

// Adapted from https://stackoverflow.com/questions/27327067/append-text-or-data-to-text-file-in-swift
public extension String {

    func appendLineToURL(fileURL: URL) throws {
         try (self + "\n").appendToURL(fileURL: fileURL)
     }

    // swiftlint:disable force_unwrapping
     func appendToURL(fileURL: URL) throws {
         let data = self.data(using: String.Encoding.utf8)!
         try data.append(fileURL: fileURL)
     }
    // swiftlint:enable force_unwrapping

}

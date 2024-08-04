//
//  Data.swift
//
//
//  Created by Lonnie Gerol on 11/8/23.
//

import Foundation

// Adapted from https://stackoverflow.com/questions/27327067/append-text-or-data-to-text-file-in-swift
public extension Data {

    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        } else {
            try write(to: fileURL, options: .atomic)
        }
    }

}

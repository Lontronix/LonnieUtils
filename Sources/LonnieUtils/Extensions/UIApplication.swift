//
//  UIApplication.swift
//
//
//  Created by Lonnie Gerol on 11/8/23.
//

#if canImport(UIKit)
import Foundation
import UIKit

public extension UIApplication {

    /// The release or version number of the bundle. (i.e. 2023.1)
    static var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    /// The version of the build that identifies an iteration of the bundle.
    static var bundleVersion: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    /// The user-visible name for the bundle, used by Siri and visible on the iOS Home screen.
    static var displayName: String {
        Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }

}
#endif

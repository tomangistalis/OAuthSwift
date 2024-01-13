//
//  OAuthSwiftOpenURLExternally.swift
//  OAuthSwift
//
//  Created by phimage on 01/11/2019.
//  Copyright © 2019 Dongri Jin, Marchand Eric. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(OSX)
import AppKit
#endif

/// Open externally using open url application function.
open class OAuthSwiftOpenURLExternally: OAuthSwiftURLHandlerType {

    public static var sharedInstance: OAuthSwiftOpenURLExternally = OAuthSwiftOpenURLExternally()

    @objc open func handle(_ url: URL) {
        DispatchQueue.main.async {
            #if canImport(UIKit)
            #if !OAUTH_APP_EXTENSIONS

            if #available(iOS 10.0, tvOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                #if os(visionOS)
                UIApplication.shared.open(url)
                #else
                UIApplication.shared.openURL(url)
                #endif
            }
            #endif
            #elseif os(watchOS)
            // WATCHOS: not implemented
            #elseif os(OSX)
            NSWorkspace.shared.open(url)
            #endif
        }
    }
}

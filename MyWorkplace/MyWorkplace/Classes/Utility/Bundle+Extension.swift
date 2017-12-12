//
//  Bundle+Extension.swift
//  MyWorkplace
//
//  Created by Mobile Team 1 on 10/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import Foundation


extension Bundle {
    var displayName: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ??
            (Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String) ?? ""
    }
}


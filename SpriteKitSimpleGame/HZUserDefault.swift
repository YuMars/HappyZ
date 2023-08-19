//
//  HZUserDefault.swift
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
@objc class HZUserDefault: NSObject {
    

    private static let staticInstance = HZUserDefault()

    static func instance() -> HZUserDefault {
        staticInstance
    }
    
    private override init() { }
    
    override class func copy() -> Any {
        self
    }
    
    override class func mutableCopy() -> Any {
        self
    }

    
    /// 登录
    @objc static var didLogin: Bool {
        get { return UserDefaults.standard[String(format: "6.4.31-%@", #function)] ?? false }
        set { UserDefaults.standard[String(format: "6.4.31-%@", #function)] = newValue }
    }
    
}

extension UserDefaults {
    /// 通过下标使用枚举
    subscript<T: RawRepresentable>(key: String) -> T? {
        get {
            if let rawValue = value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set { set(newValue?.rawValue, forKey: key) }
    }
    
    subscript<T>(key: String) -> T? {
        get { return value(forKey: key) as? T }
        set { set(newValue, forKey: key) }
    }
}

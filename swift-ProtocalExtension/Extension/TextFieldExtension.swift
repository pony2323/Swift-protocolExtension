//
//  TextFieldExtension.swift
//  swift-ProtocalExtension
//
//  Created by pony on 2017/5/19.
//  Copyright © 2017年 pony. All rights reserved.
//

import UIKit

// 类扩展属性标识
protocol SymbolValue {
    var limitNum: Int { set get }
    
    var lastText: String { set get }
    
}
extension UITextField: SymbolValue {
    // 旧内容
    @IBInspectable var lastText: String {
        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "lastText".hashValue)
            let obj = objc_getAssociatedObject(self, key) as? String
            return obj == nil ? "":obj!
        }
        set(newValue) {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "lastText".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // 限制长度
    @IBInspectable var limitNum: Int {
        get {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "limitNum".hashValue)
            let obj = objc_getAssociatedObject(self, key) as? Int
            return obj == nil ? 0:obj!
        }
        set(newValue) {
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "limitNum".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// textfield 扩展构造器
    ///
    /// - Parameters:
    ///   - limit: 限制长度
    ///   - placeHolder: placeHolder
    convenience init(limit:Int, placeHolder:String) {
        self.init()
        self.placeholder = placeHolder
        self.limitNum = limit
        if limit != 0 {
            
            self.addTarget(self, action: #selector(self.limitNum(_:)), for: .editingChanged)
        }
    }
    
    /// 添加长度限制
    ///
    /// - Parameter limit: 长度
    func limitLength(limit: Int) {
        self.addTarget(self, action: #selector(self.limitNum(_:)), for: .editingChanged)
    }
    
    /// textField 输入位数监听
    ///
    /// - Parameter tf: tf
    @objc private func limitNum(_ tf:UITextField) {
        
        if limitNum > 0  {
            print("限制:" + String(limitNum))
            if (tf.text?.characters.count ?? 0) > limitNum {
                self.text = self.lastText
                return
            }
        }
        self.lastText = tf.text!
    }
    
}



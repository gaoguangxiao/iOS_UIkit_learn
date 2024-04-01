//
//  ZKAPPConfig.swift
//  ZKBaseSwiftProject
//
//  Created by 高广校 on 2024/1/8.
//

import Foundation

class ZKAPPConfig {
    
}

public enum DevelopmentMode {
    //调试模式
    public static var isTest: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }
}

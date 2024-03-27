//
//  GXTaskDownTimer.swift
//  RSBridgeCore
//
//  Created by 高广校 on 2024/2/4.
//

import Foundation

public class GXTaskDownTimer: NSObject {
    
    /// 息屏倒计时
    var idleRetainCount = 0.0
    
    /// 息屏定时器
    var idleTime: Timer?
    
    /// 息屏完成回调
    var idleTimerComplete: ZKDoubleClosure?
    
    public var isDownTimer: Bool {
        return idleRetainCount > 0
    }
    
    public func initIdleTimer(retaminCount: Double,block: @escaping ZKDoubleClosure) {
        if idleTime != nil {
            
        } else {
            //定时器初始化
            idleTime = Timer.scheduledTimer(withTimeInterval:1, repeats: true) { [weak self] t in
                guard let self = self else {
                    return
                }
                self.updateIdleTime(t)
            }
        }
        idleRetainCount = retaminCount
        self.idleTimerComplete = block
    }
    
    @objc func updateIdleTime(_ timer: Timer) {
        idleRetainCount -= 1
//        ZKLog("进入系统倒计时：\(idleRetainCount)")
        if idleRetainCount <= 0 {
            idleTime?.invalidate()
            idleTime = nil
        }
        self.idleTimerComplete?(idleRetainCount)
    }
    
    deinit {
        ZKLog("\(self)deinit")
    }
}

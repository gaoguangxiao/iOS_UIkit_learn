//
//  ZKJSONModel.swift
//  ZKBaseSwiftProject
//
//  Created by 高广校 on 2023/11/27.
//

import UIKit
import HandyJSON

open class ZKJSONModel: NSObject ,HandyJSON {
    
    var id: String?
    
    open var desc: String?
    
    required public override init() {
        super.init()
        //        fatalError("init() has not been implemented")
    }
    
    public func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &id, name: "ID")
        mapper.specify(property: &desc, name: "description")
    }
}

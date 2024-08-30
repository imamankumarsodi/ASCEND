//
//  Element_Per.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
import UIKit
class ElementPer {
    var title = String()
    var id = String()
    var count = Int()
    var isSelected = Bool()
    init(title:String,id:String,count:Int,isSelected:Bool){
        self.title = title
        self.id = id
        self.count = count
        self.isSelected = isSelected
    }
}

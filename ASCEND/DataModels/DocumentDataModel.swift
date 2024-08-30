//
//  DocumentDataModel.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//


import Foundation
import UIKit
class DocumentDataModel{
    var data = Data()
    var type = String()
    var withName = String()
    var fileName = String()
    var mimeType = String()
    init(data:Data, type:String, withName:String, fileName:String, mimeType:String){
        self.data = data
        self.type = type
        self.withName = withName
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

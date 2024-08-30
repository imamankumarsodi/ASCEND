//
//  ElementDI.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
protocol ElementDI {
    //TODO: Prepare data static source implementation
    func prepareDataSourceStatic() -> ElementPerViewModelList
    
}

extension ElementDI{
    func prepareDataSourceStatic() -> ElementPerViewModelList{
        return ElementPerViewModelList(elements: [ElementPer]())
    }
}

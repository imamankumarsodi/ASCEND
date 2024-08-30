//
//  SuggestedTopicVM.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
import UIKit
class SuggestedTopicVM: ElementDI {
    //TODO: Singleton object
    static let shared = SuggestedTopicVM()
    private init() {}
    
    //TODO: Prepare data source implementation
    func prepareDataSourceStatic() -> ElementPerViewModelList{
        
        let dataStores = [ElementPer(title: "Self Improvement", id: String(), count: 2, isSelected: Bool()),
                          ElementPer(title: "Motivation", id: String(), count: 7, isSelected: Bool()),
                          ElementPer(title: "Spirituality", id: String(), count: 5, isSelected: true),
                          ElementPer(title: "Positivity", id: String(), count: Int(), isSelected: Bool()),
                          ElementPer(title: "Self Improvement", id: String(), count: Int(), isSelected: Bool()),
                          ElementPer(title: "Motivation", id: String(), count: 3, isSelected: true),
                          ElementPer(title: "Spirituality", id: String(), count: 1, isSelected: Bool()),
                          ElementPer(title: "Positivity", id: String(), count: 6, isSelected:true),
                          ElementPer(title: "Self Improvement", id: String(), count: 2, isSelected: Bool()),
                          ElementPer(title: "Motivation", id: String(), count: 7, isSelected: Bool()),
                          ElementPer(title: "Spirituality", id: String(), count: 5, isSelected: true),
                          ElementPer(title: "Positivity", id: String(), count: Int(), isSelected: Bool()),
                          ElementPer(title: "Self Improvement", id: String(), count: Int(), isSelected: Bool()),
                          ElementPer(title: "Motivation", id: String(), count: 3, isSelected: true),
                          ElementPer(title: "Spirituality", id: String(), count: 1, isSelected: Bool()),
                          ElementPer(title: "Positivity", id: String(), count: 6, isSelected:true)]
        
        return ElementPerViewModelList(elements: dataStores)
    }
}


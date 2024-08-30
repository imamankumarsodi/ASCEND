//
//  Element_PerViewModel.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation

struct ElementPerViewModelList {
    var elements:[ElementPer]
}



extension ElementPerViewModelList{
    var numberOfSections:Int{
        return 1
    }
    
    
    public func numberOfRowsInSection(_ section:Int) -> Int{
        return self.elements.count
    }
    
    
    public func elementAt(_ index:Int) -> ElementPerViewModel{
        return ElementPerViewModel(element: self.elements[index])
    }
    
}




//TODO: Child view model for showing a single category
struct ElementPerViewModel {
     let element:ElementPer
}

extension ElementPerViewModel{
    init(_ element:ElementPer) {
        self.element = element
    }
}

extension ElementPerViewModel{
    var title:String{
        return self.element.title
    }
    
    var count:Int{
        return self.element.count
    }
    
    var id:String{
        return self.element.id
    }
    
    var isSelected:Bool{
        return self.element.isSelected
    }
    
}

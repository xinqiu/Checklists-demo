//
//   ChecklistItem.swift
//  Checklists
//
//  Created by 仇鑫 on 15/11/4.
//  Copyright © 2015年 Xin Qiu. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
}
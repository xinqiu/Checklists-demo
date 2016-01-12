//
//  AddItemViewController.swift
//  Checklists
//
//  Created by 仇鑫 on 15/11/13.
//  Copyright © 2015年 Xin Qiu. All rights reserved.
//
 
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller:AddItemViewController,
        didFinishAddItem item: ChecklistItem)
        
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    @IBOutlet weak var textField: UITextField!
    
    weak var delegrate: AddItemViewControllerDelegate?
    
    @IBAction func cancel(){
        delegrate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegrate?.addItemViewController(self, didFinishAddItem: item)
    }
    
    override func tableView(tableView: UITableView,
        willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
            
            return nil;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let oldText: NSString = textField.text!
            let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
            doneBarButton.enabled = (newText.length > 0)
            return true
    }
    
}
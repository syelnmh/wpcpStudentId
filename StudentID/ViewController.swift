//
//  ViewController.swift
//  StudentID
//
//  Created by Matthew Reed on 3/21/16.
//  Copyright © 2016 Walter Payton College Prep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barcodeImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var noIDView: UIView!
    @IBOutlet weak var barcodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let id = BarCode.idNumber {
            showBarcode(id)
        } else {
            noIDView.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //addons here
    

    //end
    @IBAction func enterManuallyPressed(sender: AnyObject) {
        
        //swift lesson 1: the '!' is for unwarpping a wrapped object. For some reason, barcodeTextField.text has been turned into an object - KN
        
        if barcodeTextField.text?.characters.count == 8 && Int(barcodeTextField.text!) != nil {
            BarCode.idNumber = barcodeTextField.text
            showBarcode(BarCode.idNumber)
            barcodeTextField.text = ""
            barcodeTextField.resignFirstResponder()
        } else {
            let alert = UIAlertController(title: "ID must be 8 digits long", message: nil, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func deleteButtonPressed(sender: AnyObject) {
        let alert = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .Alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .Destructive) { (action) -> Void in
            BarCode.idNumber = nil
            self.noIDView.hidden = false
        }
        
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showBarcode(id: String?) {
        if let id = id {
            barcodeImageView.image = BarCode.fromIDNumber(id)
            idLabel.text = id
            noIDView.hidden = true
        }
    }

}


//
//  Barcode.swift
//  StudentID
//
//  Created by Matthew Reed on 3/21/16.
//  Copyright © 2016 Walter Payton College Prep. All rights reserved.
//

import UIKit
import CoreImage

let idNumberKey = "idNumberKey"

class BarCode {
    static var idNumber: String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(idNumberKey)
        }
        
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: idNumberKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    class func fromIDNumber(string: String) -> UIImage? {
        let data = string.dataUsingEncoding(NSASCIIStringEncoding)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        if let image = filter?.outputImage {
            return UIImage(CIImage: image)
        }
        return nil
    }
}
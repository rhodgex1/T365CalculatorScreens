//
//  ScreenshotsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/3/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ScreenshotsController: UIViewController {

    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Screenshots"
        displayImagePickerController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension ScreenshotsController {
    private func displayImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            imagePickerController.sourceType = .PhotoLibrary;
            imagePickerController.allowsEditing = false
            
            self.view.addSubview(imagePickerController.view)
            imagePickerController.viewWillAppear(true)
            imagePickerController.viewDidAppear(true)
        }
        else {
            //TODO: handle if condition
        }
    }
}



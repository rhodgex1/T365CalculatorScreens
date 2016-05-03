//
//  FeedbackForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/3/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class FeedbackForm: UITableViewController {
    // declaring outlets
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var deviceModel: UILabel!
    @IBOutlet weak var osVersion: UILabel!
    @IBOutlet weak var appVersion: UILabel!

    private var imagePickerController: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- TableView delegate methods
extension FeedbackForm {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cellReuseIdentifier = super.tableView(tableView, cellForRowAtIndexPath: indexPath).reuseIdentifier where cellReuseIdentifier == "ScreehshotsCell"{
            // Showing UIImagePickerController
            if imagePickerController == nil {
                imagePickerController = UIImagePickerController()
            }
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
                imagePickerController!.delegate = self
                imagePickerController!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                
                presentViewController(imagePickerController!, animated: true, completion: nil)
            }
            
        }
    }
}

//MARK:- UINavigationControllerDelegate implementation
extension FeedbackForm : UINavigationControllerDelegate {
    // configure shown view controller
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool)
    {
        viewController.navigationItem.title = "Screenshots"
        
    }
}

//MARK:- UIImagePickerControllerDelegate implementation
extension FeedbackForm : UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let _ = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //TODO: do somethign with picked image

        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
}

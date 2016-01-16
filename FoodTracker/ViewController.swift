//
//  ViewController.swift
//  FoodTracker
//
//  Created by Niranjan Prithviraj on 1/14/16.
//  Copyright © 2016 Niranjan Prithviraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var ratingControl: RatingControl!

    // MARK: Properties
    @IBOutlet weak var MealLabel: UILabel!
    @IBOutlet weak var MealText: UITextField!

    @IBOutlet weak var MealImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MealText.delegate = self;
    }

/*    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        MealLabel.text = textField.text
    }
    
    // MARK: actions
    @IBAction func MealButton(sender: UIButton) {
        MealLabel.text = "default"
    }

    @IBAction func selectMealImage(sender: UITapGestureRecognizer) {
        MealText.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        MealImage.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
}


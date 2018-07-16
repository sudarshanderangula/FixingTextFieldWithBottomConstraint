//
//  ViewController.swift
//  FixingTextField
//
//  Created by VenkatPeetla on 16/07/18.
//  Copyright © 2018 VenkatPeetla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bottomspace: NSLayoutConstraint!
//    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    var height:Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

    }
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight : Int = Int(keyboardSize.height + 10.0)
            print("keyboardHeight",keyboardHeight)
            height = Float(keyboardHeight)
            bottomspace.constant = CGFloat(Float(keyboardHeight))

        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        bottomspace.constant = CGFloat(height)

        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//          scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        bottomspace.constant = 96

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        textField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

    }

}


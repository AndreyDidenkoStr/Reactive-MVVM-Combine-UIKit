//
//  ViewController.swift
//  Reactive MVVM Combine UIKit
//
//  Created by Andrey Kapitalov on 25.08.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {



    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var textOne: String = " " {
        didSet {
            label.text = textOne + textTwo
        }
    }
    var textTwo: String = " " {
        didSet {
            label.text = textOne + textTwo
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldOne {
            textOne = textField.text!
        } else if textField == textFieldTwo {
            textTwo = textField.text!
        }
        return true
    }
}


//
//  ViewController.swift
//  Reactive MVVM Combine UIKit
//
//  Created by Andrey Kapitalov on 25.08.2022.
//

import UIKit
import Combine

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @Published var labelValue: String? = "value"
    
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldOne.delegate = self
        
        self.cancellable = self.$labelValue.receive(on: DispatchQueue.main)
            .assign(to: \.text, on: self.label)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.labelValue = textField.text
        return true
    }
    
    
}


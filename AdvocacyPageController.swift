//
//  AdvocacyPageController.swift
//  testingscrollthing
//
//  Created by Scholar on 8/2/22.
//

import UIKit

class AdvocacyPageController: UIViewController {

    @IBOutlet weak var indent: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var boxText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var firstComment: UIButton!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var secondComment: UIButton!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var thirdComment: UIButton!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var indentOneComment: UILabel!
    @IBOutlet weak var indentTwoComment: UILabel!
    @IBOutlet weak var indentThreeComment: UILabel!
    @IBOutlet weak var indentFourComment: UILabel!
    @IBOutlet weak var cancelOutletOne: UIButton!
    @IBOutlet weak var cancelOutletTwo: UIButton!
    @IBOutlet weak var cancelOutletThree: UIButton!
    @IBOutlet weak var cancelOutletFour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isHidden = true
        boxText.isHidden = true
        submitButton.isHidden = true
        indent.isHidden = true
        firstTextField.isHidden = true
        firstComment.isHidden = true
        firstLabel.isHidden = true
        indentOneComment.isHidden = true
    }

    @IBAction func submitTapped(_ sender: Any) {
        boxText.isHidden = false
        if let newLabel = textField.text {
            boxText.text = newLabel
        }
        textField.isHidden = true
        submitButton.isHidden = true
        indent.isHidden = false
        firstTextField.isHidden = false
        firstComment.isHidden = false
        firstLabel.isHidden = false
        indentOneComment.isHidden = false
    }
    @IBAction func buttonIsTapped(_ sender: Any) {
        textField.isHidden = false
        submitButton.isHidden = false
        
    }
    
    @IBAction func commentOneTap(_ sender: Any) {
        firstTextField.isHidden = true
        firstComment.isHidden = true
        if let newText = firstTextField.text {
            firstLabel.text = newText
        }
    }
    
    @IBAction func commentTwoTap(_ sender: Any) {
        secondTextField.isHidden = true
        secondComment.isHidden = true
        if let newTextTwo = secondTextField.text {
            secondLabel.text = newTextTwo
        }
    }
    
    @IBAction func commentThreeTap(_ sender: Any) {
        thirdTextField.isHidden = true
        thirdComment.isHidden = true
        if let newTextThree = thirdTextField.text {
            thirdLabel.text = newTextThree
        }
    }
    
    @IBAction func commentFourTap(_ sender: Any) {
        fourthTextField.isHidden = true
        fourthButton.isHidden = true
        if let newTextFour = fourthTextField.text {
            fourthLabel.text = newTextFour
        }
    }
    
    @IBAction func cancelButtonOne(_ sender: Any) {
        firstLabel.isHidden = true
        indentOneComment.isHidden = true
        cancelOutletOne.isHidden = true
        firstTextField.isHidden = false
        firstComment.isHidden = false
    }
    
    @IBAction func cancelButtonTwo(_ sender: Any) {
        secondLabel.isHidden = true
        indentTwoComment.isHidden = true
        cancelOutletTwo.isHidden = true
        secondTextField.isHidden = false
        secondComment.isHidden = false
        
    }
    @IBAction func cancelButtonThree(_ sender: Any) {
        thirdLabel.isHidden = true
        indentThreeComment.isHidden = true
        cancelOutletThree.isHidden = true
        thirdTextField.isHidden = false
        thirdComment.isHidden = false
    }
    
    
    @IBAction func cancelButtonFour(_ sender: Any) {
        fourthLabel.isHidden = true
        indentFourComment.isHidden = true
        cancelOutletFour.isHidden = true
        fourthTextField.isHidden = false
        fourthButton.isHidden = false
    }
}

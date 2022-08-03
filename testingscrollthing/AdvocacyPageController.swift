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
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isHidden = true
        boxText.isHidden = true
        submitButton.isHidden = true
        indent.isHidden = true
    }

    @IBAction func submitTapped(_ sender: Any) {
        boxText.isHidden = false
        if let newLabel = textField.text {
            boxText.text = newLabel
        }
        textField.isHidden = true
        submitButton.isHidden = true
        indent.isHidden = false
    }
    @IBAction func buttonIsTapped(_ sender: Any) {
        textField.isHidden = false
        submitButton.isHidden = false
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

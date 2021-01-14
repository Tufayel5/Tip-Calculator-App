//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Tufayel Ahmed on 12/19/20.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        splitControl.addTarget(self, action: #selector(updateView), for: .valueChanged)
        splitControl.value = 1
        splitControl.minimumValue = 1
        splitControl.maximumValue = 10
        splitControl.stepValue = 1
       
        middleView.layer.cornerRadius = 10
        middleView2.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        
        billAmountTextField.delegate = self
    }

    func textFieldShouldReturn(_ billAmountTextField: UITextField) -> Bool {
      billAmountTextField.resignFirstResponder()
      return true
    }
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var middleView2: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var splitControl: UIStepper!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalForOne = total / splitControl.value
        
        totalPerPerson.text = String(format: "$%.2f", totalForOne )
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
   @objc func updateView() {
        numberOfPeople.text = "\(Int(splitControl.value))"
    }
    
}


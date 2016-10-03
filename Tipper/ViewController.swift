//
//  ViewController.swift
//  Tipper
//
//  Created by Zeeshan Mughal on 10/2/16.
//  Copyright © 2016 Tipper 87 Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func amountChanged(_ sender: UITextField) {
		self.compute()
	}
	@IBAction func tipChanged(_ sender: UISegmentedControl) {
		self.compute()
	}
	@IBOutlet weak var tipSegmentedControl: UISegmentedControl!
	@IBOutlet weak var amountField: UITextField!
	@IBOutlet weak var totalField: UILabel!
	@IBOutlet weak var tipField: UILabel!
	func compute() {
		let amount = Double(self.amountField.text!) ?? 0.0
		let tips = [0.18, 0.20, 0.30]
		let tip = amount * tips[self.tipSegmentedControl.selectedSegmentIndex]
		let total = amount + tip
		self.tipField.text = String(format: "$%.2f", tip)
		self.totalField.text = String(format: "$%.2f", total)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		self.amountField.keyboardType = UIKeyboardType.decimalPad
		self.amountField.becomeFirstResponder()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}


}


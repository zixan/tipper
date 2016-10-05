//
//  ViewController.swift
//  Tipper
//
//  Created by Zeeshan Mughal on 10/2/16.
//  Copyright © 2016 Tipper 87 Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let defaults = UserDefaults.standard
	@IBAction func amountChanged(_ sender: UITextField) {
		defaults.set(sender.text, forKey: "amount")
		self.compute()
		
	}
	@IBAction func tipChanged(_ sender: UISegmentedControl) {
		defaults.set(sender.selectedSegmentIndex, forKey: "tipSegment")
		self.compute()
	}
	@IBOutlet weak var tipSegmentedControl: UISegmentedControl!
	@IBOutlet weak var amountField: UITextField!
	@IBOutlet weak var totalField: UILabel!
	@IBOutlet weak var tipField: UILabel!
	func compute() {
		let amount = Double(defaults.string(forKey: "amount")!) ?? 0.0
		let tips = [0.18, 0.20, 0.30]
		let tip = amount * tips[defaults.integer(forKey: "tipSegment")]
		let total = amount + tip
		self.tipField.text = String(format: "$%.2f", tip)
		self.totalField.text = String(format: "$%.2f", total)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		self.amountField.keyboardType = UIKeyboardType.decimalPad
		self.amountField.becomeFirstResponder()
		self.tipSegmentedControl.selectedSegmentIndex = defaults.integer(forKey: "tipSegment")
		self.amountField.text = defaults.string(forKey: "amount")
		self.compute()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}


}


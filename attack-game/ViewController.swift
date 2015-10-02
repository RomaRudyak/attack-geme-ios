//
//  ViewController.swift
//  attack-game
//
//  Created by Admin on 10/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var game = Game()

	override func viewDidLoad() {
		super.viewDidLoad()

		game.printLabel = printLbl
		game.leftAttackButton = leftAttackBtn
		game.rightAttackButton = rightAttackBtn
		game.rightHpLbl = rightHpLabel
		game.leftHpLbl = leftHpLabel
		
		game.start(Orc(name: "Trastng", initHp: 300, attackPwr: 5), right: Solider(name: "Tom", initHp: 100, attackPwr: 36))
		
		game.print("Hello brave warriors!")
	}

	@IBAction func onRestartTaped(sender: AnyObject) {
		restartButton.hidden = true
		restart()
	}
	
	func restart(){
		leftAttackBtn.enabled = true
		rightAttackBtn.enabled = true
		game.start(Orc(name: "Trastng", initHp: 300, attackPwr: 5), right: Solider(name: "Tom", initHp: 100, attackPwr: 36))
		
		game.print("Hello brave warriors!")

	}
	
	@IBAction func onLeftAttacks(sender: AnyObject) {
		game.leftAttack()
		checkIfGameended()
	}

	@IBAction func onRightAttacks(sender: AnyObject) {
		game.rightAttack()
		checkIfGameended()
	}
	
	func checkIfGameended(){
		if !game.isGameOver{
			return
		}
		
		if let winner = game.winner {
			game.print("\(winner.name) won the battle!!!")
			restartButton.hidden = false
			leftAttackBtn.enabled = false
			rightAttackBtn.enabled = false
		}
	}

	@IBOutlet weak var restartButton: UIButton!
	@IBOutlet weak var rightHpLabel: UILabel!
	@IBOutlet weak var leftHpLabel: UILabel!
	@IBOutlet weak var printLbl: UILabel!
	@IBOutlet weak var rightAttackBtn: UIButton!
	@IBOutlet weak var leftAttackBtn: UIButton!
}


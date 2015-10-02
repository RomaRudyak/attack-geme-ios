//
//  Game.swift
//  attack-game
//
//  Created by Admin on 10/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

import Foundation
import UIKit

class Game : NSObject {
	
	var leftPlayer:Character?
	var rightPlayer:Character?
	
	var leftAttackButton: UIButton?
	var rightAttackButton: UIButton?
	var printLabel: UILabel?
	var leftHpLbl: UILabel?
	var rightHpLbl: UILabel?
	
	var isGameOver:Bool{
		
		if let left = leftPlayer, let right = rightPlayer{
			return !left.isAlive || !right.isAlive
		}
		
		return false;
	}
	
	var winner:Character?{
		if !isGameOver{
			return nil
		}
		
		if let right = rightPlayer where right.isAlive{
			return right
		}
		
		if let left = leftPlayer where left.isAlive{
			return left
		}
		
		return nil
	}
	
	func start(left:Character,right:Character){
		self.leftPlayer = left
		self.rightPlayer = right
		printHp(leftPlayer, label: leftHpLbl)
		printHp(rightPlayer, label: rightHpLbl)
	}
	
	func rightAttack() -> Bool{
		let attackStatus = performAttack(rightPlayer, defending: leftPlayer)
		printHp(leftPlayer, label: leftHpLbl)
		printAttack(attackStatus, agresor: rightPlayer, defending: leftPlayer)
		if !isGameOver {
			disableButton(leftAttackButton)
		}
		return attackStatus
	}
	
	func leftAttack() -> Bool{
		let attackStatus = performAttack(leftPlayer, defending: rightPlayer)
		printHp(rightPlayer, label: rightHpLbl)
		printAttack(attackStatus, agresor: leftPlayer, defending: rightPlayer)
		if !isGameOver {
			disableButton(rightAttackButton)
		}
		return attackStatus
	}
	
	func enableButton(timer:NSTimer!){
		if isGameOver{
			return
		}
		let btn = timer.userInfo as? UIButton
		btn?.enabled = true
	}
	
	func print(msg:String){
		printLabel?.text = msg
	}
	
	private func printAttack(attackStatus:Bool, agresor:Character?,defending:Character?){
		if let a = agresor, let d = defending {
			if attackStatus {
				print("\(a.name) inflicted damage to \(d.name)")
			} else {
				print("\(d.name) blocked \(a.name) attack")
			}
		}
	}
	
	private func printHp(character:Character?, label:UILabel?){
		if let c = character {
			label?.text = "\(c.hp >= 0 ? c.hp : 0) HP"
		}
	}
	
	private func performAttack(agresor:Character?,defending:Character?) -> Bool {
		if let d = defending, let a = agresor{
			return d.attempAttack(a.attackPwr)
		}
		
		return false;
	}
	
	private func disableButton(btn:UIButton?){
		if let b = btn where !b.enabled{
			return
		}
		
		btn?.enabled = false
		
		NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableButton:", userInfo: btn, repeats: false)
	}

}
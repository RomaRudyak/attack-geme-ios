//
//  Character.swift
//  attack-game
//
//  Created by Admin on 10/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

import Foundation

class Character {
	
	var hp:Int{
		return _hp
	}
	
	var name:String{
		return _name
	}
	
	var attackPwr:Int{
		return _attackPwr
	}
	
	var isAlive:Bool{
		return _hp > 0
	}
	
	init(name:String,initHp:Int,attackPwr:Int){
		self._name = name
		self._hp = initHp
		self._attackPwr = attackPwr
	}
	
	func attempAttack(attackPwr:Int) -> Bool{
		self._hp -= attackPwr
		
		return true;
	}
	
	private var  _hp: Int
	private var _attackPwr: Int
	private var _name: String
}
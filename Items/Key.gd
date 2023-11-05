extends "res://Items/Item.gd"

func collect(inventory: Inventory):
	global.has_key = true
	super(inventory)

	

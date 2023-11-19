extends "res://Items/Item.gd"

func collect(inventory: Inventory):
	global.has_bomba = true
	global.bomba_count += 3
	super(inventory)


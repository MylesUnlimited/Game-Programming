extends Area2D

@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()
	
func remove(inventory: Inventory):
	inventory.remove(itemRes)
	queue_free()
	

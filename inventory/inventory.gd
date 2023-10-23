extends Resource

class_name Inventory

signal updated

@export var items: Array[InventoryItem]

func insert(item: InventoryItem):
	for i in range(items.size()):
		if !items[i]:
			items[i] = item
			break
	updated.emit()
	
func remove(item: InventoryItem):
	for i in range(items.size()):
		if item == items[i]:
			items[i] = null
			break
	updated.emit()
	

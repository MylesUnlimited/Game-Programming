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

func retrieve(item: InventoryItem):
	if !found(item):
		#throw exception
		print("bug")
	for i in range(items.size()):
		if item == items[i]:
			items[i] = null
			break		
	updated.emit()

	
func found(item: InventoryItem) -> bool:
	for i in range(items.size()):
		if item == items[i]:
			return true	
	return false
		
		
		

extends CharacterBody2D

func _on_area_2d_area_entered(area):
	if global.has_key == false:
		print(global.has_key)
	else:
		print("Player has key")
		queue_free()


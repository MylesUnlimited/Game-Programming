extends CharacterBody2D
#var context = get_tree().get_current_scene().get_name()

func _process(delta):
	if OtherWorldManagement.buttons_pressed == OtherWorldManagement.button_count:
		queue_free()


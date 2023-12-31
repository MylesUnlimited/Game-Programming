extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_transition_point_body_entered(body):
	if body.has_method("player") == true:
		# print(global.transition_scene)
		global.transition_scene = true
		# print(global.transition_scene)


func _on_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "other_world":
			get_tree().change_scene_to_file("res://Scenes/world.tscn")
			global.finish_changescene()



#Testing if buttons are pressed
func _on_button_body_entered(body):
	if body.has_method("pushable_block"):
		OtherWorldManagement.buttons_pressed += 1
		print(OtherWorldManagement.buttons_pressed)


func _on_button_2_body_entered(body):
	if body.has_method("pushable_block"):
		OtherWorldManagement.buttons_pressed += 1
		print(OtherWorldManagement.buttons_pressed)

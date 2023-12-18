extends Area2D

#This is Akai's work!!!

var entered = false


func _on_body_entered(body):
	entered = true
	



func _on_body_exited(body):
	entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_pressed("enter"):
			get_tree().change_scene_to_file("res://Scenes/world.tscn")

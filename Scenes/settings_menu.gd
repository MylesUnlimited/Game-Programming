class_name SettingsMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/exit as Button


#signal exit_options_menu





# Called when the node enters the scene tree for the first time.
#func _ready():
#	exit_button.button_down.connect(on_exit_pressed)
#	set_process(false)
	
	
#func on_exit_pressed() -> void:
#	exit_options_menu.emit()
#	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

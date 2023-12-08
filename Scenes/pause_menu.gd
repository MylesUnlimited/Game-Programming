extends Control

@onready var main = $"res://Scenes/world.tscn"
#@onready var pause = $PauseMenu

var _is_paused:bool = false:
	set = set_paused
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self._is_paused = !_is_paused
	
	
func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused


func _on_resume_pressed() -> void:
	_is_paused = false



func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")




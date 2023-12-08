extends Control


@onready var start_button = $VBoxContainer/StartGame as Button
@onready var exit_button = $VBoxContainer/Quit as Button
@onready var options_button = $VBoxContainer/Settings as Button
@onready var options_menu = $SettingsMenu as SettingsMenu
@onready var vbox = $VBoxContainer as VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	

#func on_options_pressed() -> void:
#	vbox.visible = false
#	options_button.set_process(true)
#	options_button.visible = true

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
	


#func handle_connecting_signals() -> void:
#	options_button.button_down.connect(on_options_pressed)
#	options_menu.exit_options_menu.connect(on_exit_options_menu)




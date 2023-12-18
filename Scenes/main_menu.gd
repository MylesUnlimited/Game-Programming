extends Control

#Akai Has worked on this!!!

@onready var start_button = $VBoxContainer/StartGame as Button
@onready var exit_button = $VBoxContainer/Quit as Button
@onready var options_button = $VBoxContainer/Settings as Button
@onready var options_menu = $SettingsMenu as SettingsMenu
@onready var vbox = $VBoxContainer as VBoxContainer
# Called when the node enters the scene tree for the first time.


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()

class_name SettingsMenu
extends Control

#This was Akai's work!!!

@onready var exit_button = $MarginContainer/VBoxContainer/exit as Button



func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

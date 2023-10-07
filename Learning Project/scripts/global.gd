extends Node

var current_scene = "world" #base
var transition_scene: bool = false
var has_key: bool = false

var player_exit_world_x = 0
var player_exit_world_y = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changescene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "other_world"
		else:
			current_scene = "world"
		

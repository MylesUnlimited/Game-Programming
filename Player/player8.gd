extends CharacterBody2D

@export var speed: int = 100
const max_speed = 150
const accel = 10000
const friction = 10000
@onready var animations = $AnimationPlayer
var input = Vector2.ZERO
var col_idx
var push_force = 280.0

@onready var animation_tree : AnimationTree = $AnimationTree




@onready var pause_menu = $TileMap/Player8/Camera2D/PauseMenu
var paused = false


#This is a test comment for testing commits

signal bomba_placed(bomba_scene, location)

@export var inventory: Inventory

var bomba_scene = preload('res://Items/bomba/WeaponBomba.tscn')
@onready var placement = $CollisionShape2D
var direction : Vector2 = Vector2.ZERO



func _ready():
	animation_tree.active = true


func player():
	pass
	
func handleInput():
	#var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
	
	
func playerMovement(delta):
	input = handleInput()
	if input.normalized() == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	
	move_and_slide()
	
	#for collision with block purposes
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	

	
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = ""
		if Input.is_action_pressed("ui_down"): direction = "down"
		if Input.is_action_pressed("ui_up"): direction = "up"
		if Input.is_action_pressed("ui_left"): direction = "left"
		if Input.is_action_pressed("ui_right"):direction = "right"
		if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_up"): direction = "up_right"
		if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_up"): direction = "up_left"
		if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_down"): direction = "down_right"
		if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_down"): direction = "down_left"
		if Input.is_action_just_pressed("attack"):
			animations.play("attack")
		animations.play(direction)

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print_debug(collider.name)
		
func _process(delta):
	if Input.is_action_just_pressed("bomba"):
		place_bomba()
		
#	if Input.is_action_just_pressed("pause"):
#		pauseMenu()
		
	
func _physics_process(delta):
	playerMovement(delta)
	updateAnimation()


func _on_hurtbox_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)



func update_animation_parameters():
	if (velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true

	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Move/blend_position"] = direction
func place_bomba():
	bomba_placed.emit(bomba_scene,placement.global_position)


#func pauseMenu():
#	if paused:
#		pause_menu.hide()
#		Engine.time_scale = 1
#	else:
#		pause_menu.show()
#		Engine.time_scale = 0
#
#	paused = !paused


extends CharacterBody2D

@export var speed: int = 100
const max_speed = 150
const accel = 10000
const friction = 10000
@onready var animations = $AnimationPlayer
var input = Vector2.ZERO

#This is a test comment for testing commits

@export var inventory: Inventory


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
	
		animations.play(direction)

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print_debug(collider.name)
	
func _physics_process(delta):
	playerMovement(delta)
	updateAnimation()


func _on_hurtbox_area_entered(area):
	if area.has_method("collect"):
		area.collect()

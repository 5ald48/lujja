extends CharacterBody2D




var speed :float = 400
var direction 
var distance 
var friction :float = 0.97
var dead_zone :float = 100


func _physics_process(delta):
	
	distance = global_position.distance_to(get_global_mouse_position())
	
	if Input.is_action_just_pressed("swiming"):
		direction = global_position.direction_to(get_global_mouse_position())
		if distance >= dead_zone:
			velocity = direction *  speed
	else:
		velocity *=  friction 

	if distance >= dead_zone:
		look_at(get_global_mouse_position())

	move_and_slide()

extends CharacterBody2D



@export var speed : float = 100
@export var health : float = 10
@export var attack_damage : float = 10
@export var attack_speed : float = 10
@export var stop_distance : float = 0



func _physics_process(_delta: float) -> void:
	
	var distance = global_position.distance_to(GlobalData.player_current_location)
	
	if distance > stop_distance:
		var direction = global_position.direction_to(GlobalData.player_current_location)
		velocity = direction * speed
	
	else:
		velocity = Vector2(0,0)

	move_and_slide()

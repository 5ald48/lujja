extends CharacterBody2D



@export var speed : float = 100
@export var health : float = 10
@export var attack_damage : float = 10
@export var attack_speed : float = 10
@export var stop_distance : float = 0

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D




func _physics_process(_delta: float) -> void:
	
	
	var distance = global_position.distance_to(GlobalData.player_current_location)
	
	navigation_agent_2d.target_position = GlobalData.player_current_location
	
	if distance > stop_distance:
		var direction = global_position.direction_to(navigation_agent_2d.get_next_path_position())
		velocity = direction * speed
	
	else:
		velocity = Vector2(0,0)

	move_and_slide()

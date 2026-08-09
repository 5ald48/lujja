extends CharacterBody2D



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var surround_light: PointLight2D = $surround_light
@onready var swim_paricle: CPUParticles2D = $swim_paricle



var speed :float = 200
var direction 
var distance 
var friction :float = 0.97
var dead_zone :float = 25


func _physics_process(_delta):
	
	distance = global_position.distance_to(get_global_mouse_position())
	
	if Input.is_action_just_pressed("swiming"):
		direction = global_position.direction_to(get_global_mouse_position())
		if distance >= dead_zone:
			velocity = direction *  speed # moving
			animated_sprite_2d.play("swiming") # animation play
			GlobalData.current_air -= 1 # air decraseing
			swim_paricle.restart() # particle turning on
	else:
		velocity *=  friction 

	if distance >= dead_zone:
		look_at(get_global_mouse_position())

	move_and_slide()


func _process(_delta: float) -> void:
	surround_light.global_rotation = 0 # so the light dont rotate with the player

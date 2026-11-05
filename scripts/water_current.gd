extends Area2D

@export_range(0, 360, 1) var direction_degrees: float = 0.0 # to chose the pushing digree

@export var current_strength: float = 1000.0 # current power

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var bodies_in: Array = [] # array to store any body that enter the current to affect it

func _ready() -> void:
	cpu_particles_2d.rotation_degrees = direction_degrees # to change the particle too the degree

func _get_direction_vector() -> Vector2:
	return Vector2.RIGHT.rotated(deg_to_rad(direction_degrees))

func _physics_process(delta: float) -> void:
	var dir = _get_direction_vector()
	for body in bodies_in: # to loop all thr bodis too affect them all
		body.velocity += dir * current_strength * delta # this is the affect

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies_in.append(body) # adds the body too the array

func _on_body_exited(body: Node2D) -> void:
	if body in bodies_in:
		bodies_in.erase(body) # remove the body from the array

extends Node2D

@onready var player: CharacterBody2D = $".."




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalData.current_air <= 0:
		player.global_position = Vector2(100,100)
		await get_tree().create_timer(1.0).timeout
		GlobalData.current_air = GlobalData.max_air

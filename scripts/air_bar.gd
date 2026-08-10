extends ProgressBar

@onready var air_bar: ProgressBar = $"."
@onready var rich_text_label: RichTextLabel = $RichTextLabel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	air_bar.max_value = GlobalData.max_air
	air_bar.value = GlobalData.current_air
	
	rich_text_label.text = "o2 "  + str(GlobalData.current_air)

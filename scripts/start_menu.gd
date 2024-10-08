extends CanvasLayer

@onready var start_button = $HUD/Start
@onready var quit_button = $HUD/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_pressed_start_button) # Replace with function body.
	quit_button.pressed.connect(_on_pressed_quit_button) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_pressed_start_button():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
func _on_pressed_quit_button():
	get_tree().quit()

extends Node2D

signal trap_touched(body)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		trap_touched.emit(body)# Replace with function body.


func _on_trap_touched(body: Variant) -> void:
	pass # Replace with function body.

extends Area2D

@onready var trophy = $Trophy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trophy.play("idle") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	trophy.play("win") # Replace with function body.
 # Replace with function body.

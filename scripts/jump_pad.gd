extends Area2D

@export var jump_pad_force = 400
@onready var jump_pad = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jump_pad.play("idle") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		jump_pad.play("jump") # Replace with function body.
		body.jump(jump_pad_force)

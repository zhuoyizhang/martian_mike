extends CharacterBody2D
class_name Player

@onready var animated_player = $AnimatedPlayer

@export var gravity = 300
@export var speed = 150
@export var jump_force = 150

@onready var player_active = true

func _physics_process(delta: float) -> void:
	
		
	var x_direction = Input.get_axis("press_left","press_right")
	var y_direction = Input.is_action_just_pressed("jump")
	#animated_player.flip_h = false
	if player_active:
		if is_on_floor() == false:  #  in the air
			#animated_player.animation = "fall"
			velocity.y += gravity * delta
			if velocity.y > 500:
				velocity.y = 500
			
		else:   # on the floor
			if x_direction != 0:     #left or right
				#animated_player.animation = "run"
				#if x_direction != 0:
					#animated_player.flip_h = (x_direction == -1)
				velocity.x += speed * x_direction * delta	
			else:
				#animated_player.animation = "idle"
				velocity.x = 0
			
			if y_direction:   #jump
				#animated_player.animation = "jump"
				jump(jump_force)
	
	update_animations(x_direction)
		
		
	move_and_slide()


func update_animations(x_direction):
	if !is_on_floor(): #in the air
		if velocity.y > 0:
			animated_player.play("fall")
		else:
			animated_player.play("jump")

	else:  
		if x_direction != 0:#on the ground
			animated_player.play("run")
			animated_player.flip_h = (x_direction == -1)
		else:
			animated_player.play("idle")

		
func jump(jump_force):
	velocity.y = -jump_force

func stop():
	velocity.x = 0

func _on_death_zone_body_entered(body: Node2D) -> void:
	emit_signal("died") # Replace with function body.

extends Node2D

@onready var player = $Player
@onready var start = $Start
@onready var deathzone = $DeathZone
@onready var exit = $Exit
@export var next_level:PackedScene = null

@export var time_left = 100
@onready var hud = $UILayer/HUD

var timer_node:Timer = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("trap_touched", _on_trap_touched) # Replace with function body.
	deathzone.body_entered.connect(_on_death_zone_body_entered)
	exit.body_entered.connect(_on_exit_body_entered)
	
	timer_node = Timer.new()
	timer_node.name = "Level Timer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timer_timeout)
	add_child(timer_node)
	timer_node.start()

func _on_level_timer_timeout():
	time_left -= 1
	hud.set_label_text(time_left)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("quit"):
		#get_tree().quit()
	#elif Input.is_action_just_pressed("reset"):
		#get_tree().reload_current_scene()
		
		


func _on_player_died() -> void:
	reset_player()

func _on_trap_touched(body: Variant) -> void:
	reset_player()

func reset_player():
	player.global_position = start.get_spawn_position() # Replace with function body.
	


func _on_jump_pad_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_death_zone_body_entered(body: Node2D) -> void:
	reset_player()
 # Replace with function body.


func _on_exit_body_entered(body: Node2D) -> void:
	if body is Player:
		player.player_active = false
		player.stop()
		await(get_tree().create_timer(2).timeout)
		if next_level != null:
			get_tree().change_scene_to_packed(next_level)
	 # Replace with function body.

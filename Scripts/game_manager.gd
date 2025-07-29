extends Node

@export var ent_manager: EntManager
@export var cur_time: int

func _ready() -> void:
	pass

func finish_player_turn() -> void:
	# Determine where the player should be added
	ent_manager.reset_ent_pos(ent_manager.player_ent)

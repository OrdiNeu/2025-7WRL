extends Node
class_name EntManager

@export var ents: Array[Entity]
@export var player_ent: Player

func _ready() -> void:
	run_next_turn()

func run_next_turn() -> void:
	# Execute actions on entities
	if len(ents) <= 0:
		print("ERROR: No entities found to execute anything for?")
		return
	var ent:Entity = ents[0]
	ent.finish_turn.connect(on_turn_finish)
	ent.execute_turn()

func on_turn_finish(ent: Entity, _time_to_next_move: float) -> void:
	ent.finish_turn.disconnect(on_turn_finish)
	reset_ent_pos(ent)
	run_next_turn()

func reset_ent_pos(ent: Entity) -> void:
	# Remove the ent from our list of ents
	var ent_pos := ents.find(ent)
	if ent_pos >= 0:
		ents.remove_at(ent_pos)

	# Re-add the ent to our list of ents in the correct position
	var last_pos := 0
	for i in range(len(ents)):
		if ents[i].time_to_next_move > ent.time_to_next_move:
			# ent with later time found; stop here
			break
		last_pos = i + 1
	ents.insert(last_pos, ent)

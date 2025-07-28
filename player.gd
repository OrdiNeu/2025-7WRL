extends Entity

func _input(event):
	if event.is_action_pressed("MOVE_UP") \
		or event.is_action_pressed("MOVE_UPLEFT") \
		or event.is_action_pressed("MOVE_UPRIGHT"):
		game_pos += Vector2i(0, -1)
	if event.is_action_pressed("MOVE_RIGHT") \
		or event.is_action_pressed("MOVE_UPRIGHT") \
		or event.is_action_pressed("MOVE_DOWNRIGHT"):
		game_pos += Vector2i(+1, 0)
	if event.is_action_pressed("MOVE_LEFT") \
		or event.is_action_pressed("MOVE_UPLEFT") \
		or event.is_action_pressed("MOVE_DOWNLEFT"):
		game_pos += Vector2i(-1, 0)
	if event.is_action_pressed("MOVE_DOWN") \
		or event.is_action_pressed("MOVE_DOWNLEFT") \
		or event.is_action_pressed("MOVE_DOWNRIGHT"):
		game_pos += Vector2i(0, +1)

# temporary movement
func _process(_delta: float) -> void:
	reset_position()

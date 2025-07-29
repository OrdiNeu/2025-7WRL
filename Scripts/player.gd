extends Entity

class_name Player

func move(x: int, y: int) -> void:
	if is_turn:
		game_pos += Vector2i(x, y)
		time_to_next_move += 10
		end_turn()

func think() -> void:
	# Don't let our turn auto-pass
	# Instead, what we do depends on user input, so we wait
	pass

func _input(event):
	if event.is_action_pressed("MOVE_UP") \
		or event.is_action_pressed("MOVE_UPLEFT") \
		or event.is_action_pressed("MOVE_UPRIGHT"):
		move(0, -1)
	if event.is_action_pressed("MOVE_RIGHT") \
		or event.is_action_pressed("MOVE_UPRIGHT") \
		or event.is_action_pressed("MOVE_DOWNRIGHT"):
		move(+1, 0)
	if event.is_action_pressed("MOVE_LEFT") \
		or event.is_action_pressed("MOVE_UPLEFT") \
		or event.is_action_pressed("MOVE_DOWNLEFT"):
		move(-1, 0)
	if event.is_action_pressed("MOVE_DOWN") \
		or event.is_action_pressed("MOVE_DOWNLEFT") \
		or event.is_action_pressed("MOVE_DOWNRIGHT"):
		move(0, +1)

# temporary movement
func _process(_delta: float) -> void:
	reset_position()

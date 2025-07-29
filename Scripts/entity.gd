extends Node2D

class_name Entity

signal finish_turn(me: Entity, time_to_next_move: float)

@export var game_pos: Vector2i
@export var sprite: Sprite2D
@export var time_to_next_move: float
@export var is_turn: bool

var CELL_WIDTH := 32
var CELL_HEIGHT := 42

func reset_position() -> void:
	position = (game_pos as Vector2) * Vector2(CELL_WIDTH, CELL_HEIGHT);

func _process(_delta: float) -> void:
	reset_position()

func think() -> void:
	# pass without doing anything
	time_to_next_move += 10
	end_turn()

func execute_turn() -> void:
	is_turn = true
	think()

func end_turn() -> void:
	is_turn = false
	finish_turn.emit(self, time_to_next_move)

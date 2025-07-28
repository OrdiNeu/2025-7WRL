extends Node2D

class_name Entity

@export var game_pos : Vector2i
@export var sprite : Sprite2D

func reset_position() -> void:
	position = (game_pos as Vector2) * Vector2(16, 21);

func _process(_delta: float) -> void:
	reset_position()

extends TileMapLayer

class_name MapLayer

@export var walkable: Array[bool]
@export var WIDTH: int
@export var HEIGHT: int

func init() -> void:
	walkable.resize(WIDTH * HEIGHT)
	walkable.fill(true)
	
	# initialize the terrain
	pass

func is_terrain_walkable(x: int, y: int) -> bool:
	return walkable[y*WIDTH + x]

func in_bounds(x: int, y: int) -> bool:
	return 0 <= x && x < WIDTH && 0 <= y && y < HEIGHT

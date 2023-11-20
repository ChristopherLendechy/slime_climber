extends Sprite2D

@export var layer = 1
var speedOffset = -0.02


func _process(delta: float) -> void:
	global_position = global_position - Vector2(0,speedOffset) * layer

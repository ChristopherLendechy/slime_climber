extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func PlayDefaultAnimation():
	animated_sprite_2d.play("default")

func MoveDown():
	var tween
	tween = create_tween()
	tween.tween_property($".","position",Vector2(0, 700),2)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		if area.get_parent().get_parent().isFlying:
			print("hurt")
		else:
			print("player dead")

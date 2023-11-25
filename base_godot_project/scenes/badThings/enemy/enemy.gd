extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $BatSprite2


var LeftPos = Vector2(-230,0)
var RightPos = Vector2(230,0)
var Left = true
signal enemyHit(enemy)
signal playerHit


var tween
func PlayDefaultAnimation():
	animated_sprite_2d.play("default")

	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		if area.get_parent().get_parent().isFlying:
			print("hurt")
			enemyHit.emit(self)
		else:
			playerHit.emit()
			print("player dead")


func Swappable():
	var random_lOrR = randi() % 2
	if random_lOrR == 0:
		Left = false
	
	
func StartLeft():
	position = LeftPos
	tween = create_tween()
	tween.parallel().tween_property($".","position",Vector2(230, 700),2)
	
func StartRight():
	position = RightPos
	tween = create_tween()
	tween.parallel().tween_property($".","position",Vector2(-230, 700),2)

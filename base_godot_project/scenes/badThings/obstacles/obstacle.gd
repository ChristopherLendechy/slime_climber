extends Node2D

var LeftPos = Vector2(50,0)
var RightPos = Vector2(400,0)
var Left = true
signal playerHit

func MoveDown():
	var tween
	tween = create_tween()
	tween.tween_property($".","global_position",self.global_position + Vector2(0, 800),2)
	
func StartLeft():
	global_position = LeftPos
	
func StartRight():
	$Sprite2D.flip_v = true
	global_position = RightPos
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		playerHit.emit()
		print("player dead")

func Swappable():
	var random_lOrR = randi() % 2
	if random_lOrR == 0:
		Left = false
	

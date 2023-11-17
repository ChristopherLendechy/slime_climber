extends Node2D

var LeftPos = Vector2(50,0)
var RightPos = Vector2(430,0)
var Left = true


func MoveDown():
	var tween
	tween = create_tween()
	tween.tween_property($".","global_position",self.global_position + Vector2(0, 700),2)

func StartLeft():
	global_position = LeftPos
	
func StartRight():
	global_position = RightPos
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		if area.get_parent().get_parent().isFlying:
			print("hurt")
		else:
			print("player dead")

func Swappable():
	var random_lOrR = randi() % 2
	if random_lOrR == 0:
		Left = false
	

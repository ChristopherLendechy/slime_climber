extends Node2D

@export var animated_sprite_2d: AnimatedSprite2D

@onready var soundQueue = $SoundQueue
var LeftPos = Vector2(450,-48)
var RightPos = Vector2(45,-48)
var Left = true
signal enemyHit(enemy)
signal playerHit


var tween
func PlayDefaultAnimation():
	animated_sprite_2d.play("default")

	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("SNAIL")
		if area.get_parent().get_parent().isFlying:
			print("hurt")
			playThisSound()
			enemyHit.emit(self)
		else:
			playerHit.emit()
			print("player dead")


func Swappable():
	var random_lOrR = randi() % 2
	if random_lOrR == 0:
		Left = false
	
	
func MoveDownAndRight():
	%SnailSprite.global_position = RightPos
	var tween1
	var tween2
	tween1 = create_tween()
	tween2 = create_tween()
	tween1.parallel().tween_property(self,"global_position",self.global_position + Vector2(0, 900),3)
	tween2.parallel().tween_property(%SnailSprite,"global_position",%SnailSprite.global_position+Vector2(600, 900),3)

func MoveDownAndLeft():
	%SnailSprite.flip_h = true
	%SnailSprite.global_position = LeftPos
	var tween1
	var tween2
	tween1 = create_tween()
	tween2 = create_tween()
	tween1.parallel().tween_property(self,"global_position",self.global_position + Vector2(0, 900),3)
	tween2.parallel().tween_property(%SnailSprite,"global_position",%SnailSprite.global_position+Vector2(-600, 900),3)

func _ready() -> void:
	$TestWall.global_position = Vector2(240,23)

func playThisSound():
	soundQueue.play_sound()

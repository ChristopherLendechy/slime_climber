extends Node2D

@onready var _animation_player = $AnimationPlayer

var walk_right = true
func _ready() -> void:
	_animation_player.play("Walk")
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("space hit")
		_animation_player.stop()
		if walk_right:
			_animation_player.play("Fly")
		else:
			_animation_player.play("Fly_Left")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	if anim_name == "Fly" or anim_name == "Fly_Left":
		if walk_right:
			walk_right = false
			_animation_player.play("Walk_LEFT")
		else:
			walk_right = true
			_animation_player.play("Walk")

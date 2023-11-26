extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var tween
var fromLeft = true
var startingPos
var isFlying = false
func _ready() -> void:
	animated_sprite_2d.play("default2")
	startingPos = self.global_position
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):

		if tween != null and !tween.is_running():
			animated_sprite_2d.stop()
			Fly()
		elif tween == null:
			animated_sprite_2d.stop()
			Fly()

func Fly():
	print("flying")
	isFlying = true
	tween = create_tween()
	if fromLeft:
		animated_sprite_2d.play("flying")
		tween.parallel().tween_property($AnimatedSprite2D,"rotation",deg_to_rad(-90), 0.5)
		tween.parallel().tween_property($AnimatedSprite2D,"global_position",startingPos + Vector2(290,0),0.5)
		fromLeft = false
	else:
		animated_sprite_2d.play("flying")
		tween.parallel().tween_property($AnimatedSprite2D,"rotation",deg_to_rad(90), 0.5)
		tween.parallel().tween_property($AnimatedSprite2D,"global_position",startingPos,0.5)
		fromLeft =  true
		
	tween.connect("finished",startAnimation,4)
	
func startAnimation():
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	animated_sprite_2d.play("default2")
	print("not flying")
	isFlying = false
	
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().get_parent().isFlying:
			print("hurt")
		else:
			print("player dead")
	pass # Replace with function body.

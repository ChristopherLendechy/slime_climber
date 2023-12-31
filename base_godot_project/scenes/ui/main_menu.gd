extends Control

var next_scene = preload("res://scenes/playground/playground_base_level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.PlaySongLoop()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_pressed():
	get_tree().change_scene_to_packed(next_scene)


func _on_exit_button_pressed() -> void:
	get_tree().quit()

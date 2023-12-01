extends Node2D

var current_power_up
var number_of_powerup: int
var score : int = 0


@onready var spawner = %spawner
@onready var timer = $GameTimer
@onready var score_label = %ScoreLabel
@onready var score_label_final = %ScoreLabelFinal
var next_scene = load("res://scenes/ui/main_menu.tscn")
var gameover = false
func _ready():
	spawner.pointsAdd.connect(addToScore)
	spawner.gameOver.connect(gameOver)

func addToScore(points):
	score = score + points
	print("Score: ", score)

func gameOver():
	print("gameOver")
	gameover = true
	%ScoreLabel.visible = false
	%spawner.visible = false
	$player.visible = false
	$Control/RestartPanel.visible = true
	$Control/RestartPanel/SlimeHop.play("default")
	$Control/RestartPanel/SlimeHop2.play("default")
func _process(delta):
	if gameover != true:
		score = score + 5
		score_label.text = str(score)
		score_label_final.text = str(score)




func _on_restart_button_pressed() -> void:
	print("Reset")
	SoundManager.StopSongLoop()
	get_tree().change_scene_to_packed(next_scene)

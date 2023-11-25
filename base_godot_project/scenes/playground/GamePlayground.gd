extends Node2D

var current_power_up
var number_of_powerup: int
var score : int = 0
@onready var spawner = %spawner
@onready var timer = $GameTimer
@onready var score_label = %ScoreLabel
func _ready():
	spawner.pointsAdd.connect(addToScore)
	spawner.gameOver.connect(gameOver)

func addToScore(points):
	score = score + points
	print("Score: ", score)

func gameOver():
	print("gameOver")
	get_tree().paused = true

func _process(delta):
	score = score + 5
	score_label.text = str(score)

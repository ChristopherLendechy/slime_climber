extends Marker2D

#Level Spawn Types

@export var LEVEL1 : Array[PackedScene] = []
var currentLevel = 1
signal pointsAdd(points)
signal gameOver

func spawn_enemy():
	match currentLevel:
		1:
			var random_index = randi() % LEVEL1.size()
			var enemy_scene = LEVEL1[random_index]
			var enemy_instance = enemy_scene.instantiate()
			add_child(enemy_instance)
			print("Added Enemy")
			if(enemy_instance.is_in_group("enemy")):
				enemy_instance.connect("enemyHit", addPoints)
			enemy_instance.connect("playerHit", gameOverHappened)
				
			make_do_thing(enemy_instance)
		
	
func _on_timer_timeout() -> void:
	spawn_enemy()

func _ready():
	$Timer.start()

func make_do_thing(enemy):
	if enemy.has_method("Swappable"):
		enemy.Swappable()
	if enemy.has_method("StartLeft"):
		if enemy.Left:
			enemy.StartLeft()
	if enemy.has_method("StartRight"):
		if !enemy.Left:
			enemy.StartRight()
	if enemy.has_method("PlayDefaultAnimation"):
		enemy.PlayDefaultAnimation()
	if enemy.has_method("MoveDown"):
		enemy.MoveDown()


func _on_despawner_area_entered(area: Area2D) -> void:
	await get_tree().create_timer(0.3).timeout
	area.get_parent().queue_free()
	

func addPoints(enemyPoint):
	pointsAdd.emit(500)

func gameOverHappened():
	gameOver.emit()

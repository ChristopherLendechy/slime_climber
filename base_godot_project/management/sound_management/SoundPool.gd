@tool
class_name SoundPool
extends Node
## SoundPool - part of sound management
##
## Collection of similar sounds to pick a random side and play, and can be used to prevent the same sound to be used twice. Not needed if only using one effect
## 
## @tutorial: 	https://www.youtube.com/watch?v=bdsHf08QmZ4

var sounds : Array[SoundQueue] = []

var random = RandomNumberGenerator.new()
var lastIndex = -1
func _ready() -> void:
	for child in get_children():
		if child is SoundQueue:
			sounds.append(child)
			
func play_random_sound():
	#var index = random.randi_range(0, sounds.size() - 1)
	#sounds[index].play_sound
	var index
	while true:
		index = random.randi_range(0, sounds.size() - 1)
		if index != lastIndex:
			break
	lastIndex = index
	sounds[index].play_sound()

func _get_configuration_warnings() -> PackedStringArray:
	var number_of_sound_queue_childern = 0
	var warnings: PackedStringArray = []
	for child in get_children():
		if child is SoundQueue:
			number_of_sound_queue_childern += 1
			
	if number_of_sound_queue_childern < 2:
		warnings.append("At least two or much child of type SoundQueue is needed")
		return warnings
		
	return super._get_configuration_warnings()
	

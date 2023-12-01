@tool
class_name SoundQueue
extends Node
## SoundQueue - Part of sound management  
## 
## Used to prevent sounds from being cut off when wanting to play the same sound over and over
## Add as child to nodes that make sounds. One AudioStreaemPlayer as a child of this. Then a count
## depending on how often this you thing overlap could happen. start with 5?
## 
##
## @tutorial:	https://www.youtube.com/watch?v=bdsHf08QmZ4

@export var count: int
var next: int = 0

var audioStreamPlayers: Array[AudioStreamPlayer] = []

func _ready() -> void:
	
	if get_child_count() == 0:
		pass
	var child = get_child(0)
	if child is AudioStreamPlayer:
		audioStreamPlayers.append(child)
		for i in range(count):
			var dup = child.duplicate() as AudioStreamPlayer
			add_child(dup)
			audioStreamPlayers.append(dup)
		
	
	
func _get_configuration_warnings() -> PackedStringArray:
	
	var warnings: PackedStringArray = []
	if get_child_count() == 0:
		warnings.append("No child found")
		return warnings
	elif not (get_child(0) is AudioStreamPlayer):
		warnings.append("Chlid not AudioStreamPlayer")
		return warnings
		
	return PackedStringArray()
	

func play_sound():
	if !audioStreamPlayers[next].playing:
		audioStreamPlayers[next].play()
		next = next + 1
		next %=audioStreamPlayers.size()

func stop_sound():
		if audioStreamPlayers[next -1].playing:
			audioStreamPlayers[next -1].stop()
	

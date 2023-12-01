extends Node
## Sound Manager - part of sound management
##
## Allows object that use the same sound to share a [SoundPool] or [SoundQueue]
## To use, add a [SoundPool] or [SoundQueue] to this node, andd add it to the relevent dictonary. 
## Then add a playXSound function. Then on object reference SoundManger.Instance.playXSound 
## 
## @tutorial: 	https://www.youtube.com/watch?v=bdsHf08QmZ4

static var Instance
var soundQueuesByName: Dictionary = {} # <string,SoundQueue>
var soundPoolssByName = {} # <string,SoundPool>
func _ready() -> void:
	Instance = self
	# Example - REMOVE After Use
	soundQueuesByName["song_loop"] = %CameraFlashSQ


# Example, remove after use
func PlaySongLoop():
	soundQueuesByName["song_loop"].play_sound()


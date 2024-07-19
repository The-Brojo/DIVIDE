extends Node2D

@onready var players = {
	"NORMAL": {
		"view": $HBoxContainer/NormalViewport/SubViewport,
		"camera": $HBoxContainer/NormalViewport/SubViewport/Camera2D,
		"player": $HBoxContainer/NormalViewport/SubViewport/TestLevel/NormalPlayer,
	},
	"INVERSE": {
		"view": $HBoxContainer/InverseViewport/SubViewport,
		"camera": $HBoxContainer/InverseViewport/SubViewport/Camera2D,
		"player": $HBoxContainer/InverseViewport/SubViewport/TestLevel/NormalPlayer,
	},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	#players["INVERSE"].view.set_world_2d(players["NORMAL"].view.find_world_2d())
	for node in players.values():
		var remote_transform : RemoteTransform2D = RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)

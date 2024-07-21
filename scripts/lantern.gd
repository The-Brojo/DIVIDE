extends Node2D

signal deferred

@onready var point_light_2d: Light2D = $PointLight2D
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.call_deferred("emit_signal", "on_light_spawn", point_light_2d)

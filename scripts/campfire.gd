extends Area2D

var _animation = 'unlit'

signal deferred

@onready var point_light_2d: Light2D = $PointLight2D

	

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.call_deferred("emit_signal", "on_light_spawn", point_light_2d)
	$PointLight2D.visible = false
	_animation = 'unlit'
	play_animation()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#fire and ice balls are areas
func _light(body):
	_animation = 'lit'
	$PointLight2D.visible = true
	play_animation()
	print_debug("light")
	
	
	
func _unlight(body):
	_animation = 'unlit'
	$PointLight2D.visible = false
	play_animation()
	print_debug("unlight")
	


func play_animation():
	$AnimatedSprite2D.animation = _animation
	$AnimatedSprite2D.play()
	
	

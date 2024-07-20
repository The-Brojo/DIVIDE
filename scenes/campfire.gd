extends Area2D

var _animation = 'unlit'

# Called when the node enters the scene tree for the first time.
func _ready():
	_animation = 'unlit'
	play_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#fire and ice balls are areas
func _on_area_2d_area_entered(area):
	_animation = 'lit'
	play_animation()
	print("this area")


func play_animation():
	$Sprite2D/AnimatedSprite2D.animation = _animation
	$Sprite2D/AnimatedSprite2D.play()
	
	

#player is a body so they will light the campfire by walking over the space
func _on_area_2d_body_entered(body):
	_animation = 'lit'
	play_animation()
	

#player is a body so they will unlight the campfire by walking over the space
func _on_area_2d_body_exited(body):
	_animation = 'unlit'
	play_animation()

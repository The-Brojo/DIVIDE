extends Area2D
enum States {unpress, press, normal}
var parent: Node2D
var _animation = 'normal'
@export var _state: int = States.normal
# Called when the node enters the scene tree for the first time.
#States.keys()[_state]
func _ready():
	parent = get_parent()
	play_animation()

func toggle(called):
	_state = (_state+1)%2
	_animation = States.keys()[_state]
	play_animation()
	#add function to play when switched

# Called every frame. 'delta' is the elapsed time since the previous frame.

func play_animation():
	$picture.animation = _animation
	$picture.play()




extends CharacterBody2D

@export var speed = 4000
var _animation = 'idle_down'
var animation_format ="{state}_{direction}"


@export var is_focued: bool = true

enum States {IDLE, WALK, HURT, DIE}
enum Directions {UP, DOWN, LEFT, RIGHT}
var _state: int = States.IDLE
var _direction: int = Directions.DOWN
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction: Vector2 = Vector2.ZERO
	if  is_focued:
		direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * speed * delta
		move_and_slide()
	if direction != Vector2.ZERO:
		_state = States.WALK
	else:
		_state = States.IDLE
	
	set_direction(direction)
	_animation = animation_format.format({ 
		"state": States.keys()[_state],
		"direction": Directions.keys()[_direction],
	}).to_lower()
	play_animation()
	
	
	
func set_direction(direction: Vector2):
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			_direction = Directions.RIGHT
		else:
			_direction = Directions.LEFT
	elif direction.y > 0:
		_direction = Directions.DOWN
	elif direction.y < 0:
		_direction = Directions.UP
	

func play_animation():
	if _direction == Directions.LEFT:
		_animation = animation_format.format({
			"state": States.keys()[_state],
			"direction": Directions.keys()[Directions.RIGHT],
		}).to_lower()
	$AnimatedSprite2D.flip_h = _direction == Directions.LEFT
	$AnimatedSprite2D.animation = _animation
	$AnimatedSprite2D.play()
#

	
	
		
	

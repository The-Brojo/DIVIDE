extends Node2D

enum States {ICE, FIRE, BROKE}

@onready var map = get_parent()
@onready var fireball = load("res://scenes/spell componets/fireball.tscn")
@onready var iceball = load("res://scenes/spell componets/iceball.tscn")
@onready var spellTimer = $spellTimer
@export var _state: int = States.ICE


# Called when the node enters the scene tree for the first time.
func _ready():
	play_animation()

func stateChange():# to change the state of the wand
	_state = (_state+1)%2
	play_animation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("swapspell"):
		stateChange()
	#section to cast spell
	if Input.is_action_just_pressed("cast") and spellTimer.is_stopped():
		#choose which spell
		spells(_state) #cast which spell is sent
		spellTimer.start() #start cooldown
		
func play_animation():
	$AnimatedSprite2D.animation = States.keys()[_state]
	$AnimatedSprite2D.play()

func spells(spell):
	var instance
	if States.keys()[_state] == "FIRE":
		instance = fireball.instantiate()
						
	elif States.keys()[_state] == "ICE":
		instance = iceball.instantiate()
	else:
		return	
	instance.spawnPos = global_position
	instance.spawnRot = get_angle_to(get_global_mouse_position())
	map.add_child.call_deferred(instance)

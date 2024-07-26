extends Area2D

@export var SPEED = 200


var spawnPos : Vector2
var spawnRot : float
#var zdex : int
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	#z_index = zdex
	
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(spawnRot)
	global_position += SPEED * direction * delta
	#velocity = Vector2(0, -SPEED).rotated(spawnRot)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# spell despwan
func _on_life_timeout():
	queue_free() # Replace with function body.

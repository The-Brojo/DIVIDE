extends StaticBody2D

var _parent: Node2D

@onready var light_detection = $"Light Detection"
@onready var collision_shape_2d = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	_parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Needs timer to keep disable for set time. You will see what I mean while testing
	# Removes collision and reveals parent e.g. bridge
	collision_shape_2d.disabled = !light_detection.is_lit
	if _parent:
		_parent.visible = light_detection.is_lit

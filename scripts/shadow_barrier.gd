extends StaticBody2D

@onready var light_detection = $"Light Detection"
@onready var collision_shape_2d = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Needs timer to keep disable for set time. You will see what I mean while testing
	collision_shape_2d.disabled = !light_detection.is_lit

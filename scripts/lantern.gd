extends StaticBody2D

var placed: bool = false
var relative_position: Vector2
var parent: Node2D
var interact: Callable = Callable(self, "togglePlaced")
@onready var point_light_2d: Light2D = $PointLight2D
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	relative_position = position
	set_visible(false)
	SignalBus.call_deferred("emit_signal", "on_light_spawn", point_light_2d)

func _physics_process(_delta):
	if Input.is_action_just_pressed("lantern") and !placed:
		toggleVisible()
func toggleVisible():
	set_visible(!is_visible())
func togglePlaced():
	placed = !placed
	point_light_2d.shadow_item_cull_mask = 3 if placed else 1
	set_collision_layer_value(2, placed)
	set_as_top_level(placed)
	position = parent.global_position + relative_position if placed else relative_position

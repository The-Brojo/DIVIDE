extends Node2D

var _parent: Node

@export var _radius: int = 200
var _lights: Array[Light2D] = []
var is_lit: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_light_spawn.connect(_on_light_spawn)
	_parent = get_parent()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var lights  = _lights.map(func(light): return is_lighting_parent(light))
	is_lit = lights.has(true)
		
func is_within_radius(node: Node2D):
	return global_position.distance_to(node.global_position) <= _radius

func is_lighting_parent(light: Light2D):
	# TODO How do we distinguish between not lit and in a shadow?
	# I think we have to rely on a appropriate radius to ensure if we aren't lit we must be in shadow
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, light.global_position)
	query.exclude = [_parent]
	var result = space_state.intersect_ray(query)
	return result.is_empty() && light.is_visible_in_tree()

func _on_light_spawn(light: Light2D):
	if is_within_radius(light):
		_lights.append(light)

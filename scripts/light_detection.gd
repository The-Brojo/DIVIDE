extends Node2D

var _parent: Node

@export var _radius: int = 200
var _lights: Array[Light2D] = []
var _is_lit: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	_parent = get_parent()
	var lights  = get_tree().get_nodes_in_group("lights").filter(func(light): return is_within_radius(light))
	#print_debug()
	_lights.append_array(lights)
	print_debug(_lights)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var lights  = _lights.map(func(light): return is_lighting_parent(light))
	_is_lit = lights.has(true)
	print_debug(_is_lit)
		
func is_within_radius(node: Node2D):
	return global_position.distance_to(node.global_position) <= _radius

func is_lighting_parent(light: Light2D):
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, light.global_position)
	query.exclude = [_parent]
	var result = space_state.intersect_ray(query)
	return result.is_empty()

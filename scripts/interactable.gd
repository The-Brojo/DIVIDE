extends Area2D


var parent: Node2D
var inRange: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()

func _process(_delta):
	if Input.is_action_just_pressed("interact") and canInteract():
		parent.interact.call()

func _on_body_entered(body):
	if body is CharacterBody2D:
		inRange = true

func _on_body_exited(body):
	if body is CharacterBody2D:
		inRange = false

func canInteract() -> bool:
	return inRange and parent.is_visible_in_tree()

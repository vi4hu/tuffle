extends Node2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	position.y -= 100 * delta
	
	if position.y <= -600:
		queue_free()

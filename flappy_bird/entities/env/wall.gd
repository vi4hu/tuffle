extends Area2D


func _ready() -> void:
	connect("body_entered", self, "_detected")


func _detected(body: Node) -> void:
	if body is Bird:
		get_tree().paused = true

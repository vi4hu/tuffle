class_name Wall
extends Area2D


func _ready() -> void:
	_setup()


func _setup() -> void:
	connect("body_entered", self, "_detected")


func _detected(body: Node) -> void:
	if body is Bird:
		body.dead.play()
		get_tree().get_root().get_node("Main/C/Button").show()
		get_tree().set_pause(true)

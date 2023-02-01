extends Button


func _ready() -> void:
	connect("pressed", self, "_start")


func _start() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene("res://main.tscn")

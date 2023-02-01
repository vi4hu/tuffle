extends KinematicBody2D


func _ready():
	set_physics_process(false)


func _physics_process(delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("jmp"):
		set_physics_process(true)

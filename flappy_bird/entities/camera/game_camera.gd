extends Camera2D

var _max_speed := 100
var _offset := Vector2(233.0, 300.0)


func _ready() -> void:
	set_physics_process(false)
	position = _offset


func _physics_process(delta: float) -> void:
	position += _max_speed * delta * Vector2.RIGHT


func _unhandled_input(event) -> void:
	if event.is_action_pressed("jmp"):
		set_physics_process(true)

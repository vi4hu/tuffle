extends Node

var pipe = preload("res://entities/pipe/pipe.tscn")

var start_distance := 200
var spawn_time := 2.2
var bird


func _ready() -> void:
	_spawn()


func _spawn() -> void:
	if get_tree().paused:
		return
	bird = get_tree().get_root().get_node("Main/Bird")
	if bird.position.x >= start_distance:
		var p = pipe.instance()
		add_child(p)
		p.set_global_position(
			Vector2(
				bird.global_position.x + 1024,
				randi() % 277 +100
			)
		)
	yield(get_tree().create_timer(spawn_time), "timeout")
	_spawn()

extends Node

var enemy_scene=preload("res://entities/enemies/enemy.tscn")


func _ready():
	$"../Boundary".connect("area_entered", self, "_the_end")
	
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_create_enemy")
	timer.wait_time = 1.4
#	timer.one_shot = false # should be false by default
	timer.start()


func _create_enemy():
	var enemy = enemy_scene.instance()
	$"../Enemies".add_child(enemy)


func _the_end(body: Node) -> void:
	if body is Enemy:
		get_tree().set_pause(true)


func _on_Button_pressed():
	get_tree().quit()

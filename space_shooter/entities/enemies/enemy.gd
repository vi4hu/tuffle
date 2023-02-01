class_name Enemy
extends Node2D


var speed := 80
var enemy_list_ref: Array


func _ready():
	randomize()
	position=Vector2(rand_range(-250,250),-600) # Replace with function body.


func _process(delta):
	position.y+=speed*delta


func _on_Area2D_area_entered(area):
	if area.name == "bullet_area":
		area.get_parent().queue_free()
		queue_free()

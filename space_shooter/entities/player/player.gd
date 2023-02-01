extends Node2D

var bullet_scene=preload("res://entities/ammo/bullet.tscn")

onready var torrent_position = $TorrentPosition

const SHOOT_INTRVL := 1.0

var direction := Vector2.ZERO
var speed := 200
var player_width_half := 49
var last_shoot_time := 0.0


func _process(delta):
	last_shoot_time += delta
	if Input.is_action_just_pressed("shoot") and last_shoot_time > SHOOT_INTRVL:
		last_shoot_time = 0.0
		var bullet=bullet_scene.instance()
		bullet.position.x = position.x
		bullet.global_position = torrent_position.global_position
		get_tree().get_root().get_node("MainGame").get_node("Bullet").add_child(bullet)
		
	if Input.is_action_pressed("left"):
		direction.x=-1
	elif Input.is_action_pressed("right"):
		direction.x=1
	else:
		direction.x=0

	position.x=clamp(position.x+(direction.x*delta*speed),-300+player_width_half,300-player_width_half)
	

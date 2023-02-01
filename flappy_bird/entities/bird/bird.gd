class_name Bird
extends KinematicBody2D

onready var animations = $AnimatedSprite

var _max_speed := 140
var _velocity : Vector2
var _fly_power := -200
var _gravity_mul := 9.8

const MAX_GRAVITY := 400.0


func _ready() -> void:
	set_physics_process(false)


func _physics_process(delta: float) -> void:
	_gravity(delta)
	_velocity.x = _max_speed

	if Input.is_action_just_pressed("jmp"):
		_velocity.y = _fly_power

	_velocity = move_and_slide(_velocity)
	_tween(_velocity)


func _unhandled_input(event) -> void:
	if event.is_action_pressed("jmp"):
		set_physics_process(true)
		animations.play("fly")


func _gravity(delta: float) -> void:
	_velocity.y = min(
		_velocity.y + _gravity_mul, MAX_GRAVITY
	)


func _tween(velocity: Vector2) -> void:
	var look: float
	if velocity.y > 0:
		look = 24.0
	else:
		look = -30.0

	$Tween.interpolate_property(
		self, "rotation_degrees", rotation_degrees, look,
		0.4, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Tween.start()

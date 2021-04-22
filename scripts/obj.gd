extends KinematicBody2D

var timer = 0.0

func _ready():
	$".".global_position.x = rand_range(64, 656)
	$".".global_position.y = rand_range(64, 416)

func _on_Area2D_mouse_entered():
	global.score += 10
	global.objects -= 1
	queue_free()

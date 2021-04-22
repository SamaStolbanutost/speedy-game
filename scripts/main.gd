extends Node2D

var preloadObj = preload("res://models/obj.tscn")
var timer = 0.0
var timer_2 = 0.0
var speed_timer = 0.0

func makeObj():
	var objRef = preloadObj.instance()
	get_parent().add_child(objRef)
	

func _physics_process(delta):
	timer += delta
	timer_2 += delta
	speed_timer += delta
	
	if global.objects > 5 or global.score < 1:
		pass # please, add "game over" here
	
	if speed_timer >= 5 and global.speed >= 0.1:
		global.speed -= 0.05
		speed_timer = 0
	
	if timer >= 0.5 * global.speed * 10:
		makeObj()
		global.objects += 1
		timer = 0
	
	timer_2 += delta
	if timer_2 >= 0.1 * global.speed * 10:
		global.score -= 1
		timer_2 = 0
		
	$"Label".text = "Score: " + str(global.score)

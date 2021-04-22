extends Node2D

var preloadObj = preload("res://models/obj.tscn")
var timer = 0.0
var timer2 = 0.0
func makeObj():
	var objRef = preloadObj.instance()
	get_parent().add_child(objRef)
	

func _physics_process(delta):
	timer += delta
	timer2 += delta
	if timer >= 0.5:
		makeObj()
		timer = 0
	
	timer2 += delta
	if timer2 >= 0.1:
		global.score -= 1
		timer2 = 0
		
	$"Label".text = "Score: " + str(global.score)

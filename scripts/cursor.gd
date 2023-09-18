extends Node2D

var current_position: Array = [0,0]

func _input(event):
	if event.is_action_pressed("ui_right"):
		current_position[0] += 16
	if event.is_action_pressed("ui_left"):
		current_position[0] -= 16
	if event.is_action_pressed("ui_up"):
		current_position[1] -= 16
	if event.is_action_pressed("ui_down"):
		current_position[1] += 16
	
		
	position = Vector2(current_position[0], current_position[1])

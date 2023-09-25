extends Node2D


func _input(event):
	if event is InputEventKey:
	# if event is InputEventKey and event.action in ['up', 'down', 'left', 'right', 'a', 'b', 'start', 'select']:
		if event.pressed:
			get_tree().change_scene_to_file("res://scenes/menus/start.tscn")

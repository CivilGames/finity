extends Node2D

@onready var _animated_cursor = $CursorAnimation
@onready var full_menu = $HUD/FullMenu
var current_position: Array = [0,0]


func _ready():
	_animated_cursor.play()

func _input(event):
	if event.is_action_pressed("right"):
		current_position[0] += 16
	if event.is_action_pressed("left"):
		current_position[0] -= 16
	if event.is_action_pressed("up"):
		current_position[1] -= 16
	if event.is_action_pressed("down"):
		current_position[1] += 16
		
	if event.is_action_pressed("B"):
		full_menu.visible = !full_menu.visible
	
		
	position = Vector2(current_position[0], current_position[1])

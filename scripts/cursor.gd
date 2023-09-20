extends Node2D

@onready var _animated_cursor = $CursorAnimation
@onready var full_menu = %FullMenu
@onready var  camera =  %HUDCamera
var current_position: Array = [0,0]


func _ready():
	_animated_cursor.play()
	print('hi')
	print(range(10,100))

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
	
	if event.is_action_pressed("A"):
		print(str('cam',camera.position))
		print(str('cur', position))
	
		camera.position = position
		print(str('new_cam_pos',camera.position))
	
#	if event.is_action_pressed
		
	position = Vector2(current_position[0], current_position[1])


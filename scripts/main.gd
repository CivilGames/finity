extends Node2D

@onready var cursor = $Cursor
@onready var cursor_sprite = $Cursor/Sprite
@onready var hud = $HUD
@onready var full_menu = $HUD/CanvasLayer/HUD/FullMenu
@onready var  camera =  %Camera
@onready var ship = $Ship
@onready var fog = $Space/Map/Fog

var cursor_position: Array = [0,0]
var ship_position: Array = [0,0]

#func _process(delta):
#	camera.set_position(cursor.get_position())

func _ready():
	var cell_list = fog.get_used_cells(0)
	var cell_map_size = cell_list.size()
	var rect = fog.get_used_rect()
	

	print(rect.size.x)
	print(rect.size.y)
	print(rect.position.x)
	print(rect.position.x)

func _input(event):
	if event.is_action_pressed("right"):
		cursor_position[0] += 16
	if event.is_action_pressed("left"):
		cursor_position[0] -= 16
	if event.is_action_pressed("up"):
		cursor_position[1] -= 16
	if event.is_action_pressed("down"):
		cursor_position[1] += 16
		
	if event.is_action_pressed("B"):
		full_menu.visible = !full_menu.visible
	
	if event.is_action_pressed("A"):
		camera.set_position(cursor.get_position())
		ship.set_position(Vector2(cursor.position.x + 64, cursor.position.y + 32))
#	var tile = fog.local_to_map()
	print('local_to_map: ')
	var tile = fog.local_to_map(Vector2(cursor.position.x, cursor.position.y))
#	fog.set_cell(1, Vector2(cursor_position[0], cursor_position[1]), -1)
	cursor.position = Vector2(cursor_position[0], cursor_position[1])
	print('cursor_pos: ')
	print(cursor.position)
	fog.set_cell(0, Vector2i(tile.x, tile.y), -1)

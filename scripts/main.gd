extends Node2D

@onready var cursor = $Cursor
@onready var cursor_sprite = $Cursor/Sprite
@onready var hud = $HUD
@onready var full_menu = $HUD/RootCanvas/HUD/TopCanvas/FullMenu
@onready var  camera =  %Camera
@onready var ship = $Ship
@onready var fog = $Space/Map/Fog

var cursor_position: Vector2 = Vector2(64,36)
var ship_position: Vector2 = cursor_position

func _process(_delta):
	camera.set_position(cursor.get_position())
	

func _ready():
	cursor_sprite.play()
	cursor.set_position(cursor_position)
	ship.set_position(ship_position)
		
func _input(event):
	if event.is_action_pressed("right"):
		cursor_position.x += 16
	if event.is_action_pressed("left"):
		cursor_position.x -= 16
	if event.is_action_pressed("up"):
		cursor_position.y -= 16
	if event.is_action_pressed("down"):
		cursor_position.y += 16

	cursor.set_position(cursor_position)
	
	if event.is_action_pressed("A"):
		ship.set_position(cursor.get_position())
		var tile = fog.local_to_map(cursor_position)
		fog.set_cell(0, Vector2i(tile.x, tile.y), -1)
	
	if event.is_action_pressed("B"):
		full_menu.visible = !full_menu.visible


	

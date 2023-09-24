extends Node2D

@onready var cursor = $Cursor
@onready var hud = get_node("HUD")
@onready var buttons = $HUD/HUDControl/RootCanvas/HUD/TopCanvas/ButtonControl
#@onready var full_menu = $HUD/RootCanvas/HUD/TopCanvas/FullMenu
@onready var  camera =  %Camera
@onready var ship = $Ship
#@onready var fog = $Space/Map/Fog 
#@onready var space = $Space
@onready var system = get_tree().get_nodes_in_group("astro_systems")[0]
@onready var fog = system.fog

var cursor_position: Vector2 = Vector2(64,36)
var ship_position: Vector2 = cursor_position

func _process(_delta):
	cursor.set_position(cursor_position)
	camera.set_position(cursor.get_position())
	

func _ready():
	cursor.set_position(cursor_position)
	ship.set_position(ship_position)

#	get_tree().change_scene_to_packed(system)
	
	
#	print(current_systems[0].system_resources)
#	hud.menu_button.grab_focus()
#	hud.mode.connect(_menu_mode_test)

func load_map():
	pass

func _input(event):
	if event.is_action_pressed("right"):
		cursor_position.x += 16
	if event.is_action_pressed("left"):
		cursor_position.x -= 16
	if event.is_action_pressed("up"):
		cursor_position.y -= 16
	if event.is_action_pressed("down"):
		cursor_position.y += 16

	if event.is_action_pressed("A"):
		ship.set_position(cursor.get_position())
		var tile = fog.local_to_map(cursor_position)
		fog.set_cell(0, Vector2i(tile.x, tile.y), -1)
	
#	if event.is_action_pressed("B"):
#		full_menu.visible = !full_menu.visible

#func _menu_mode_test(mode, toggled):
#	if (mode == 'scan' or mode == 'jump') and toggled:
#		print('hoi')
#		if Input.is_action_pressed("right"):
#			print('rechts')
#			cursor_position.x += 16
#		if Input.is_action_pressed("left"):
#			cursor_position.x -= 16
#		if Input.is_action_pressed("up"):
#			cursor_position.y -= 16
#		if Input.is_action_pressed("down"):
#			cursor_position.y += 16
##	elif mode == 'menu' and toggled:
#	else:
#		print('hai')
#		if Input.is_action_pressed("left"):
#			buttons.find_next_valid_focus()
#		if Input.is_action_pressed("right"):
#			buttons.find_next_valid_focus()

extends Node2D

@onready var cursor = $Scene/Cursor
@onready var hud = get_node("HUD")
#@onready var buttons = $HUD/HUDControl/RootCanvas/HUD/TopCanvas/ButtonControl
@onready var  camera =  %Camera
@onready var ship = $Scene/Ship
@onready var system = get_tree().get_nodes_in_group("astro_systems")[0]

@onready var resource_bar = $HUD/RootCanvas/HUDControl/HUD/ResourceBar
@onready var resource_text = $HUD/RootCanvas/HUDControl/HUD/ResourceBar/ResourceLabel
@onready var energy_bar = $HUD/RootCanvas/HUDControl/HUD/EnergyBar
@onready var energy_text = $HUD/RootCanvas/HUDControl/HUD/EnergyBar/EnergyLabel

var cursor_position: Vector2 #= Vector2(64,36)
var ship_position: Vector2 = cursor_position

func _process(_delta):
	cursor.set_position(cursor_position)
	camera.set_position(cursor.get_position())
	

func _ready():
	cursor_position = Vector2i((system.system_size[0] - 1) * 16, (system.system_size[1] - 1) * 16)
	cursor.set_position(cursor_position)
	ship.set_position(ship_position)
	resource_bar.max_value = system.system_resources
	resource_bar.value = resource_bar.max_value
	resource_text.text = str(resource_bar.value)

#	hud.menu_button.grab_focus()
#	hud.mode.connect(_menu_mode_test)

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
		ship.set_position(cursor_position)
		var tile = system.fog.local_to_map(cursor_position)
		system.fog.set_cell(0, Vector2i(tile.x, tile.y), -1)

		system.scanned.set_cells_terrain_connect(0,[Vector2i(tile.x,tile.y)],0,2,false)

	if event.is_action_pressed("start"):
		gain_energy(25)
	if event.is_action_pressed("select"):
		lose_energy(25)


func _update_resource_bar(value: float):
	resource_bar.value = value
	resource_text.text = str(value)

func _update_energy_bar(value: float):
	energy_bar.value = value
	energy_text.text = str(value)

func lose_resource(value: float):
	if resource_bar.value - value < 0:
		_update_resource_bar(0)
	else:
		_update_resource_bar(resource_bar.value - value)

func gain_energy(value: float):
	if energy_bar.value + value > energy_bar.max_value:
		_update_energy_bar(energy_bar.max_value)
	else:
		_update_energy_bar(energy_bar.value + value)

func lose_energy(value: float):
	if energy_bar.value - value < 0:
		queue_free()
	else:
		_update_energy_bar(energy_bar.value - value)


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

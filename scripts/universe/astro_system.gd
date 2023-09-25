class_name astro_system
extends Node2D

@onready var universe_data = get_node('/root/AstroGenerators')

@export var system_name: String
@export var galaxy_id: int
@export var system_id: int
@export var system_size: Array
@export var system_resources: int

@onready var body_holder = $Space/Bodies
@onready var body_scene = load('res://scenes/universe/astro_body.tscn')
@onready var space = $Space
@onready var fog = $fog
@onready var scanned = $scanned
@onready var wormhole = $Space/Wormhole

func _set_astro_bodies(bodies_data):
	for i in range(len(bodies_data)):
		var body = body_scene.instantiate()
		body.galaxy_id = galaxy_id
		body.system_id = system_id
		body.body_id = i
		body.system_size = system_size
		body_holder.add_child(body)

func _ready():
	print(universe_data.universe['galaxies'][0]['systems'])
	var system_data = universe_data.universe['galaxies'][0]['systems'][0]
	system_size = system_data['system_size']
	print(str('map_size: ', [system_size[0]*16, system_size[1]*16]))
	system_resources = system_data['system_resources']
	var bodies_data = system_data['bodies']
	_set_astro_bodies(bodies_data)
	wormhole.position = Vector2i((randi() % (system_size[0] - 1)) * 16, (randi() % (system_size[0] - 1)) * 16)
	print(str('wormhole: ', wormhole.position))
	generate_system()

func _input(event):
	if event.is_action_pressed("select"):
		fog.visible = !fog.visible

func generate_system():
	generate_system_map(system_size, fog, 0, 0)

func generate_system_map(coordinates: Array, cells: TileMap, terrain_set: int=0, terrain: int=0):
	var window: Array[Vector2i] = []
	for y in coordinates[1]:
		for x in coordinates[0]:
			window.append(Vector2i(x, y))

	cells.set_cells_terrain_connect(0,window,terrain_set,terrain,false)

func next_map():
	var galaxy_data = universe_data.universe['galaxies'][0]['systems']
	galaxy_data.pop_front()
	queue_free()
	if len(galaxy_data) == 0:
		if len(universe_data.universe['galaxies']) == 0:
			get_tree().change_scene_to_file("res://scenes/menus/end_state.tscn")
		get_tree().change_scene_to_file("res://scenes/menus/jump_galaxy.tscn")
	get_tree().change_scene_to_file("res://scenes/menus/jump_system.tscn")

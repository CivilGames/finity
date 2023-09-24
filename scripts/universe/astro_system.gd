class_name astro_system
extends Node2D

@onready var universe_data = get_node('/root/AstroGenerators')

@export var system_name: String
@export var galaxy_id: int
@export var system_id: int
@export var system_size: Array
@export var system_resources: int

@onready var body_holder = $Bodies
@onready var body_scene = load('res://scenes/universe/astro_body.tscn')

@onready var space = $space
@onready var fog = $fog
@onready var scanned = $scanned


func _set_astro_bodies(bodies_data):
	for i in range(len(bodies_data)):
		var body = body_scene.instantiate()
		body.galaxy_id = galaxy_id
		body.system_id = system_id
		body.body_id = i
		body.system_size = system_size
		body_holder.add_child(body)

func _ready():
	var system_data = universe_data.universe['galaxies'][0]['systems'][0]
	system_size = system_data['system_size']
	system_resources = system_data['system_resources']
	var bodies_data = system_data['bodies']
	_set_astro_bodies(bodies_data)
	generate_system()

func generate_system():
#	generate_system_map(system_size, space, 0, 2)
	populate_system_map()
	generate_system_map(system_size, fog, 0, 0)

func generate_system_map(coordinates: Array, cells: TileMap, terrain_set: int=0, terrain: int=0):
	var window: Array[Vector2i]
	for y in coordinates[1]:
		for x in coordinates[0]:
			window.append(Vector2i(x, y))

	cells.set_cells_terrain_connect(0,window,terrain_set,terrain,false)

func populate_system_map():
	pass


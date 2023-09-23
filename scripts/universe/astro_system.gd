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


func _set_astro_bodies(bodies_data):
	for i in range(len(bodies_data)):
		var body = body_scene.instantiate()
		body.galaxy_id = galaxy_id
		body.system_id = system_id
		body.body_id = i
		body_holder.add_child(body)

func _ready():
	var data = universe_data.universe['galaxies'][galaxy_id]['systems'][system_id]
	system_size = data['system_size']
	system_resources = data['system_resources']
	var bodies_data = data['bodies']
	_set_astro_bodies(bodies_data)

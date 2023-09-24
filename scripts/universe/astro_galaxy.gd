class_name astro_galaxy
extends Node2D

@onready var universe_data = get_node('/root/AstroGenerators')

@export var galaxy_name: String
@export var galaxy_id: int 
#@export var galaxy_size: Array

@onready var system_holder = $Systems
@onready var system_scene = load('res://scenes/universe/astro_system.tscn')


func _set_astro_systems(systems_data):
	for i in range(len(systems_data)):
		var system = system_scene.instantiate()
		system.galaxy_id = galaxy_id
		system.system_id = i
		system_holder.add_child(system)

func _set_astro_system(systems_data):
	if len(systems_data) > 0:
		var system = system_scene.instantiate()
		system.galaxy_id = galaxy_id
		system.system_id = len(systems_data)
		system_holder.add_child(system)
#		systems_data.pop_front()

func _ready():
	var systems_data = universe_data.universe['galaxies'][0]['systems']
#	var systems_data = universe_data.universe['galaxies'][galaxy_id]['systems']
	_set_astro_system(systems_data)

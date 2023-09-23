class_name astro_universe
extends Node2D

@onready var galaxy_holder = $Galaxies
@onready var galaxy_scene = load('res://scenes/universe/astro_galaxy.tscn')
@onready var universe_data = get_node('/root/AstroGenerators')

func _set_astro_galaxies(data):

	for i in len(data['galaxies'][0]):
		var galaxy = galaxy_scene.instantiate()
		galaxy_holder.add_child(galaxy)

func _ready():
	var data = universe_data.universe
	_set_astro_galaxies(data)

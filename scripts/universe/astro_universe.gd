class_name astro_universe
extends Node2D

@onready var universe_data = get_node('/root/AstroGenerators')
@onready var galaxy_holder = $Galaxies
@onready var galaxy_scene = load('res://scenes/universe/astro_galaxy.tscn')

func _set_astro_galaxies(galaxies_data):
	for i in range(len(galaxies_data)):
		var galaxy = galaxy_scene.instantiate()
		galaxy.galaxy_id = i
		galaxy_holder.add_child(galaxy)

func _set_astro_galaxy(galaxies_data):
	if len(galaxies_data) > 0:
		var galaxy = galaxy_scene.instantiate()
		galaxy.galaxy_id = len(galaxies_data)
		galaxy_holder.add_child(galaxy)

func _ready():
	var galaxies_data = universe_data.universe['galaxies']
	_set_astro_galaxy(galaxies_data)

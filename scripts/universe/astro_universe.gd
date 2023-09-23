class_name astro_universe
extends Node2D

@onready var galaxy_holder = $Galaxies
@onready var galaxy_scene = load('res://scenes/universe/astro_galaxy.tscn')

func _set_astro_galaxies():
	for i in range(3):
		var galaxy = galaxy_scene.instantiate()
		galaxy_holder.add_child(galaxy)

func _ready():
	_set_astro_galaxies()

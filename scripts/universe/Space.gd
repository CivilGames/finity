extends Node2D

@onready var universe_data = get_node("/root/AstroGenerators")
@onready var universe = $AstroUniverse

@onready var galaxies: Array
@onready var systems: Array
@onready var bodies: Array

@onready var system: astro_system

# Called when the node enters the scene tree for the first time.
#func _ready():
#
#	var system = get_map(universe_data.universe, 0, 0)
#	print(system)
#
#func get_map(universe: Dictionary, galaxy_id, system_id):
#	var system = universe['galaxies'][galaxy_id]['systems'][system_id]
#
#	return system
#
#func get_galaxy()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

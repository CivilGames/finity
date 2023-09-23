class_name astro_galaxy
extends Node2D

@export var galaxy_name: String

@onready var system_holder = $Systems
@onready var system_scene = load('res://scenes/universe/astro_system.tscn')


func _set_astro_systems():
	for i in range(3):
		var system = system_scene.instantiate()
		system_holder.add_child(system)

func _ready():
	_set_astro_systems()

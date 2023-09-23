extends Node2D

class_name astro_body

@onready var universe_data = get_node('/root/AstroGenerators')

@export var body_name: String
@export var galaxy_id: int
@export var system_id: int
@export var body_id: int

@export_enum("Planet", "Moon", "Asteroid") var object_type: int
@export var resources: int

func _ready():
	var body_data = universe_data.universe['galaxies'][galaxy_id]['systems'][system_id]['bodies'][body_id]
	object_type = body_data['object_type']
	resources = body_data['resources']


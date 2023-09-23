extends Node2D

class_name astro_body

@export var body_name: String
@export_enum("Planet", "Moon", "Asteroid") var object_type: int
@export var resources: int


func _ready():
	print('im reachable!')

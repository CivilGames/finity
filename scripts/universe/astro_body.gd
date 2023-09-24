extends Node2D

class_name astro_body

@onready var universe_data = get_node('/root/AstroGenerators')

@export var body_name: String
@export var galaxy_id: int
@export var system_id: int
@export var body_id: int
@export var system_size: Array

@export_enum("Planet", "Moon", "Asteroid") var object_type: int
@export var resources: int
@onready var sprite: Sprite2D = $BodySprite

func _ready():
	var body_data = universe_data.universe['galaxies'][0]['systems'][0]['bodies'][0]
	object_type = body_data['object_type']
	resources = body_data['resources']


	var random_length = (randi() % 9 ) * 16
	var region = Rect2(0,0,16,16)
	sprite.texture.region = region
	place_body(region)

func place_body(coords: Rect2):
	var v = Vector2i(16,16)
	sprite.position = v

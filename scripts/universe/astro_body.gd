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
	var body_data = universe_data.universe['galaxies'][0]['systems'][0]['bodies'][body_id]
	object_type = body_data['object_type']
	resources = body_data['resources']

	set_texture()
	place_body(system_size)

func set_texture():
	var random_length = (randi() % 9 ) * 16
	sprite.texture.region = Rect2(random_length,0,16,16)
	
func place_body(coords: Array):
	print(str('map_size: ', [coords[0]*16, coords[1]*16]))
	var random_x = (randi() % coords[0]) * 16
	var random_y = (randi() % coords[1]) * 16
	print(str('body coords: ', [random_x,random_y]))
	sprite.position = Vector2i(random_x,random_y)

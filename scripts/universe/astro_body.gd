class_name astro_body
extends Node2D

@onready var universe_data = get_node('/root/AstroGenerators')
@export var body_name: String
@export var galaxy_id: int
@export var system_id: int
@export var body_id: int
@export var system_size: Array
@export_enum("Planet", "Moon", "Asteroid") var object_type: int
@export var resources: int
@onready var sprite: Sprite2D = $BodySprite

func _ready() -> void:
	var body_data = universe_data.universe['galaxies'][0]['systems'][0]['bodies'][body_id]
	object_type = body_data['object_type']
	resources = body_data['resources']

	set_texture()
	place_body(system_size)

func set_texture() -> void:
	sprite.centered = true
	var random_length = (randi() % 9 ) * 16
	sprite.texture.region = Rect2(random_length, 0, 16, 16)

func place_body(coords: Array) -> void:
	var random_x = (randi() % (coords[0] - 1)) * 16
	var random_y = (randi() % (coords[1] - 1)) * 16
	print(str('body coords: ', [random_x, random_y]))
	self.position = Vector2i(random_x, random_y)

class_name astro_system
extends Node2D

@export var system_name: String

@onready var body_holder = $Bodies
@onready var body_scene = load('res://scenes/universe/astro_body.tscn')


func _set_astro_bodies():
	for i in range(3):
		var body = body_scene.instantiate()
		body_holder.add_child(body)

func _ready():
	_set_astro_bodies()

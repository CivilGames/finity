class_name astro_generators
extends Node

#@onready var objects = get_node()

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	print(str(generate_universe(rng)))



func dice(rng: RandomNumberGenerator, max_eyes: int, min_eyes: int = 1) -> int:
	return rng.randi_range(min_eyes, max_eyes)

func generate_universe(rng):
	var number_of_galaxies = dice(rng, 2, 2)

	var galaxies = []
	galaxies.append(generate_astro_object_array(rng, number_of_galaxies, "generate_galaxy", {'name': 'name'}))
	
	return galaxies
	
func generate_astro_object_array(
	rng: RandomNumberGenerator, number_of_astro_objects: int, astro_function: String, kwargs: Dictionary = {}):
	print(str(astro_function, ': ', number_of_astro_objects))
	var astro_objects = []
	for object in number_of_astro_objects:
		astro_objects.append(call(astro_function, rng, number_of_astro_objects, kwargs))
	
	return astro_objects
		
func generate_galaxy(rng, number_of_systems, kwargs):
	var systems = []
	systems.append(generate_astro_object_array(rng, dice(rng,4,2), "generate_system", kwargs))
		
	return systems

func generate_system(rng, number_of_bodies, kwargs):
	var bodies = []
	bodies.append(generate_astro_object_array(rng, dice(rng,12,6), "generate_body", kwargs))
		
	return bodies

func generate_body(rng, _number_of_objects, _kwargs):
	return {
		"name": "name",
		"object_type": dice(rng, 1,3),
		"resources": dice(rng, 100,0)		
	}
	
# body: resources, object_type, name
# system: name, size, number_of_bodies
# galaxy: name, number_of_systems
# universe: number_of_galaxies

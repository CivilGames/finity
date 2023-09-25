class_name astro_generators
extends Node

var agg: Array = []

var system_sizes: Array = [
	[8,8],
	[10,10],
	[12,12],
	[14,14],
	[16,16]
]

var universe: Dictionary = {}

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	universe = generate_universe(rng)

func generate_universe(rng):
	var number_of_galaxies = rng.randi_range(1, 3)
	var galaxies = []
	for galaxy in number_of_galaxies:
		galaxies.append(generate_galaxy(rng))

	return {'galaxies': galaxies}

func generate_galaxy(rng):
	var number_of_systems = rng.randi_range(3, 6)
	var systems = []
	for system in number_of_systems:
		systems.append(generate_system(rng))

	return {'systems': systems} 

func generate_system(rng):
	var size = system_sizes[rng.randi_range(0, 4)]
	var number_of_bodies = rng.randi_range((size[0]/2), size[0])
	var bodies = []
	for body in number_of_bodies:
		bodies.append(generate_body(rng))
		
	var sum = 0
	for body in bodies:
		sum += body['resources']
	
	return {'system_size': size, 'system_resources': sum, 'bodies': bodies}

func generate_body(rng):
	return {
		"body_name": "name",
		"object_type": rng.randi_range(1, 3),
		"resources": rng.randi_range(0, 100)
	}

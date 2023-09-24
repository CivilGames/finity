class_name astro_generators
extends Node

#@onready var objects = get_node()
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

#	if OS.is_debug_build():
#		print(true)
#		rng.seed = 42
	
	universe = generate_universe(rng)


func dice(rng: RandomNumberGenerator, max_eyes: int, min_eyes: int = 1) -> int:
	return rng.randi_range(min_eyes, max_eyes)

func generate_universe(rng):
	var number_of_galaxies = dice(rng, 6, 1)
	var galaxies = []
	for galaxy in number_of_galaxies:
		galaxies.append(generate_galaxy(rng, {}))
		
	return {'galaxies': galaxies}
		
func generate_galaxy(rng, kwargs):
	var number_of_systems = dice(rng,4,2)
	var systems = []
	for system in number_of_systems:
		systems.append(generate_system(rng, kwargs))
		
	return {'systems': systems} 
		
func generate_system(rng, kwargs):
	var size = system_sizes[dice(rng,4,0)]
	var number_of_bodies = dice(rng,floor(size[0]/2),4)
	var bodies = []
	for body in number_of_bodies:
		bodies.append(generate_body(rng, kwargs))
		
	var sum = 0
	for body in bodies:
		sum += body['resources']
	
	return {'system_size': size, 'system_resources': sum, 'bodies': bodies}
		
func generate_body(rng, kwargs):
	return {
		"body_name": "name",
		"object_type": dice(rng, 1,3),
		"resources": dice(rng, 100,0)		
	}

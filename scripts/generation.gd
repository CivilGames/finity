extends Node2D

#@onready var objects = get_node()

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(100):
		print(dice(rng,4))


func dice(rng: RandomNumberGenerator, eyes: int) -> int:
	return rng.randi_range(1,eyes)


# Zone
var universe = {}
var galaxies = {}
var stars = {}
var system = {}
var bodies = {}

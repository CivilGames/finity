extends Node2D



func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(100):
		print(dice(rng,4))


func dice(rng: RandomNumberGenerator, eyes: int) -> int:
	return rng.randi_range(1,eyes)


# Zone
zone = {
	''
}

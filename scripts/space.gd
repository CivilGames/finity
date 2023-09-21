extends Node2D

@onready var fog = $Map/Fog


# Called when the node enters the scene tree for the first time.
func _ready():
	print(fog.get_used_cells(0))

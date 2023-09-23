extends Node2D

@onready var sprite = $Sprite
#@onready var hud = get_node("HUD")


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play()
#	var hud = get_node("HUD")
#	hud.mode.connect(_on_mode_received)


func _on_mode_received(mode, toggled):
	print(mode, toggled)

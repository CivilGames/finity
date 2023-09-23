extends Node2D

@onready var start_label = $StartLabel

func _ready():
	start_label.COLOR = Color(start_label.COLOR, 1.0)
	var tween = get_tree().create_tween()
	#tween.tween_property($Sprite, "modulate", Color.RED, 1)
	tween.tween_property(start_label, 'modulate', Color.TRANSPARENT, 1)

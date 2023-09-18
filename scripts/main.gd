extends Node2D

@onready var horizontal = $Graphics/CanvasLayer/horizontal


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		print('down')
		print(horizontal.visible)
		horizontal.visible = !horizontal.visible

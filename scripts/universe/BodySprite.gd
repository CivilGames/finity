extends Sprite2D


func set_random_body_texture():
	var random_length = (randi() % 9 ) * 16
	print([random_length,0,16,16])
	texture.region = Rect2(random_length,0,16,16)

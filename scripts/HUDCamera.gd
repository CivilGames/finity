extends Camera2D


func move_camera(coordinates):
#	position
	var x_coord = coordinates.x
	var y_coord = coordinates.y
	
	print(str('x: ', x_coord, '; y: ', y_coord))

extends Node2D

@onready var scan_button = $RootCanvas/HUD/TopCanvas/ScanButton
@onready var menu_button = $RootCanvas/HUD/TopCanvas/MenuButton
@onready var jump_button = $RootCanvas/HUD/TopCanvas/JumpButton

@onready var menu = $RootCanvas/HUD/TopCanvas/FullMenu

@onready var buttons: Array = [
	scan_button, 
	menu_button, 
	jump_button
]

# Called when the node enters the scene tree for the first time.
func _ready():
	scan_button.toggled.connect(self._scan_button_pressed)
	menu_button.toggled.connect(self._menu_button_pressed)
	jump_button.toggled.connect(self._jump_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _scan_button_pressed(toggled):
	_untoggle_buttons(scan_button)



func _menu_button_pressed(toggled):
	_untoggle_buttons(menu_button)
	if toggled == true:
		menu.visible = true
	else:
		menu.visible = false


func _jump_button_pressed(toggled):
	_untoggle_buttons(jump_button)


func _untoggle_buttons(toggled_button):

	for button in buttons:
		if button != toggled_button:
			button.toggle_mode = !button.toggle_mode


extends Node2D

@onready var scan_button = $HUDControl/RootCanvas/HUD/TopCanvas/ButtonControl/ScanButton
@onready var menu_button = $HUDControl/RootCanvas/HUD/TopCanvas/ButtonControl/MenuButton
@onready var jump_button = $HUDControl/RootCanvas/HUD/TopCanvas/ButtonControl/JumpButton

@onready var menu = $HUDControl/RootCanvas/HUD/TopCanvas/FullMenu

@onready var buttons: Array = [
	scan_button, 
	menu_button, 
	jump_button
]

signal mode(active_mode: String, toggled: bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	scan_button.toggled.connect(self._scan_button_pressed)
	menu_button.toggled.connect(self._menu_button_pressed)
	jump_button.toggled.connect(self._jump_button_pressed)

func _scan_button_pressed(toggled):
	_untoggle_buttons(scan_button)
	mode.emit('scan', toggled)

func _menu_button_pressed(toggled):
	_untoggle_buttons(menu_button)
	if toggled == true:
		menu.visible = true
	else:
		menu.visible = false
	
	mode.emit('menu', toggled)

func _jump_button_pressed(toggled):
	_untoggle_buttons(jump_button)

	mode.emit('jump', toggled)

func _untoggle_buttons(toggled_button):
	for button in buttons:
		if button != toggled_button:
			button.toggle_mode = !button.toggle_mode

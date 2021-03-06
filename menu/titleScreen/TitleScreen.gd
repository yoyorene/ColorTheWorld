extends Control

func _ready():
	var Buttons = $Menu/Buttons/VBoxContainer
	Buttons.get_node("StartGameButton").grab_focus()
	for button in Buttons.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load, button])
	set_size(global.get_screen_size())
	$ColorRect.set_size(global.get_screen_size() * 2)
	get_tree().get_root().connect("size_changed", self, "resize")

func _on_button_pressed(scene_to_load, button):
	var container = $Menu/Buttons/VBoxContainer
	if button == container.get_node("StartGameButton"):
		global.load()
	elif button == container.get_node("QuitGameButton"):
		global.quit_game()
	elif button == container.get_node("NewGameButton"):
		global.delete_save()
	if scene_to_load != "":
		get_tree().change_scene(scene_to_load)

func _process(delta):
	if Input.is_action_just_pressed("ui_reset"):
		OS.window_fullscreen = !OS.window_fullscreen
	set_size(global.get_screen_size())
	$ColorRect.set_size(global.get_screen_size() * 2)

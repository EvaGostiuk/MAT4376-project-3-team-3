extends Node2D

func _input(event):
	if event.is_action_pressed("quit"):
		print("Q")
		# get_tree().change_scene("res://GraphScene.tscn")
		change_to_selected_scene()

func change_to_selected_scene():
	get_tree().change_scene(PauseMenuData.transition_destination)

func updateContentsLabel(title, content_text):
	$ScrollContainer2/VBoxContainer/Title.text = title
	$ScrollContainer2/VBoxContainer/Contents.text = content_text
